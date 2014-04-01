#!/bin/bash

if [ -r ~/.bashrc ]; then
	source ~/.bashrc
fi

LOGFILE="$HOME/Library/Logs/ADL Workbench/ADL Workbench.log"
mkdir -p "$HOME/Library/Logs/ADL Workbench"

(
	# If we are not running on OS X Mavericks, then display an error message and abort.

	if [ $(sw_vers -productVersion | awk -F "." '{print $2}') -lt 9 ]
	then
		osascript -e '
			set message to "ADL Workbench cannot run because Mac OS X 10.9 (Mavericks) is required."
			display dialog message with title "ADL Workbench" with icon stop buttons {"Quit"} default button 1'

		echo "Aborting: PATH = $PATH"
		exit 1
	fi

	# ADL Workbench relies on GTK+, which has been built under MacPorts.
	# If this machine does not have MacPorts, then we use Homebrew instead because it is much easier to install:
	# * Homebrew installs itself and the GTK+ libraries much faster than MacPorts does.
	# * Homebrew only requires Apple's Command Line Developer Tools, whereas MacPorts requires the whole of XCode, which is enormous.
	#
	# We install Homebrew the first time that the user runs ADL Workbench, if MacPorts is not found.
	# The ADL Workbench installer can't do this because Homebrew would complain that we are running as an administrator.

	if [ -z "`which port`" -a ! -x /opt/local/bin/port ]
	then
		# MacPorts is not installed, so try Homebrew.
                # Even after installing Homebrew and XQuartz, by default they are not in the PATH for GUI apps.
                # https://github.com/Homebrew/homebrew/wiki/FAQ explains this.
		PATH="$PATH:/usr/local/bin:/opt/X11/bin"

		if [ "`brew list 2>&1 | grep 'gtk+'`" != 'gtk+' -o ! -d /opt/local/lib -o -z "`which Xquartz`" ]
		then
			echo ------------------------------------------------
			echo Using Homebrew to install GTK+ for ADL Workbench

			# Open a new Terminal window so that the user can see and interact with the installation process.
			# Tell the Terminal window to fill the entire screen: twice, because telling it once doesn't work!
			# Wait for the installation process to finish, then close the Terminal window.

			osascript -e 'on run arg
				tell app "Finder" to set desktopSize to bounds of window of desktop
				tell app "Terminal"
					set terminalTab to do script arg
					set terminalWindow to first window whose selected tab is terminalTab
					set bounds of terminalWindow to desktopSize
					set bounds of terminalWindow to desktopSize
					activate terminalWindow

					repeat until busy of terminalTab
						delay 1
					end repeat

					repeat while busy of terminalTab
						delay 5
					end repeat

					close terminalWindow saving no
				end tell
			end run' "'$(dirname "$0")/setupGTK.sh'"

			# If GTK+ is still not installed, then display an error message and abort.

			if [ "`brew list 2>&1 | grep 'gtk+'`" != 'gtk+' ]
			then
				osascript -e '
					set message to "ADL Workbench cannot run because GTK+ is not installed yet."
					tell app "Finder"
						activate
						display dialog message with title "ADL Workbench" with icon stop buttons {"Quit"} default button 1
					end tell'

				echo "Aborting: PATH = $PATH"
				exit 1
			fi
		fi
	fi

	echo ------------------------------------------
	echo Launching ADL Workbench inside XQuartz

	exec "$(dirname "$(dirname "$0")")/Resources/adl_workbench" &

) 2>&1 > "$LOGFILE"

sleep 15

if [ ! -z "$(grep 'EiffelVision application could not launch, check DISPLAY environment variable' "$LOGFILE")" ]
then
	osascript -e '
		tell app "Finder"
			set message to "Please log out and log back in to finish installing XQuartz."

			try
				get application file id "org.macosforge.xquartz.X11"
			on error
				set message to "Please install XQuartz."
			end try

			activate
			display dialog message with title "ADL Workbench" with icon stop buttons {"Quit"} default button 1
		end tell'
fi
