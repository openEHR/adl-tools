#!/bin/bash

sleep 1
clear

(
	# The user's administrator password will be needed for a few operations.
	# Ask for it nicely, rather than the default prompt which is a bit cryptic.
	# Redirect stderr, just in case this this user has never run sudo before, to hide the confusing warning that appears.

	echo '***************************************************************************************'
	echo 'Please follow the prompts in this window to complete the installation of ADL Workbench.'
	echo 'This may take about 30 minutes to complete.'
	echo '***************************************************************************************'

	sleep 1

	sudo -v -p '
---------------------------------
Type your password to allow this.
---------------------------------
(Your password will not show up on the screen, but it will be there.)
Password, then press Return: ' 2>/dev/null

	# Create symbolic links pointing to the Homebrew libraries, under /opt/local where MacPorts expects its libraries to be.
	# Note that we are able to link to the Homebrew libraries even though they aren't installed yet, because symbolic links are just name references.

	if [ ! -d /opt/local/lib ]
	then
		echo
		echo '*********************************************************************'
		echo '  Creating symbolic links needed by ADL Workbench.'
		echo '*********************************************************************'
		echo

		sudo mkdir -p /opt/local/lib
		pushd /opt/local/lib
		sudo ln -s /usr/X11/lib/libX11.6.dylib
		sudo ln -s /usr/X11/lib/libXcomposite.1.dylib
		sudo ln -s /usr/X11/lib/libXcursor.1.dylib
		sudo ln -s /usr/X11/lib/libXdamage.1.dylib
		sudo ln -s /usr/X11/lib/libXext.6.dylib
		sudo ln -s /usr/X11/lib/libXfixes.3.dylib
		sudo ln -s /usr/X11/lib/libXi.6.dylib
		sudo ln -s /usr/X11/lib/libXinerama.1.dylib
		sudo ln -s /usr/X11/lib/libXrandr.2.dylib
		sudo ln -s /usr/X11/lib/libXrender.1.dylib
		sudo ln -s /usr/X11/lib/libcairo.2.dylib
		sudo ln -s /usr/X11/lib/libfontconfig.1.dylib
		sudo ln -s /usr/local/lib/libatk-1.0.0.dylib
		sudo ln -s /usr/local/lib/libfreetype.6.dylib
		sudo ln -s /usr/local/lib/libgtk-x11-2.0.0.dylib
		sudo ln -s /usr/local/opt/gettext/lib/libintl.8.dylib
		popd
	fi

	# If XQuartz is not installed yet, install it now.
	# We have to do it now because some of the dependencies of GTK+ cannot install unless X11 is already installed.
	# This approach also saves the user from having to interact with the installer.

	if [ -z "`which Xquartz`" ]
	then
		echo
		echo '*********************************************************************'
		echo '  ADL Workbench will start up inside XQuartz.'
		echo '  You do not have XQuartz installed yet.'
		echo '  Installing XQuartz now.'
		echo '*********************************************************************'
		echo

		DMG="$HOME/Downloads/XQuartz.dmg"
		curl "http://xquartz-dl.macosforge.org/SL/XQuartz-2.7.7.dmg" -o "$DMG"
		TMPMOUNT=`mktemp -d /tmp/XQuartz.XXXX`
		hdiutil attach "$DMG" -mountpoint "$TMPMOUNT"
		sudo installer -verbose -pkg "$TMPMOUNT/XQuartz.pkg" -target /
		hdiutil detach "$TMPMOUNT"
		rm -rf "$TMPMOUNT"
		rm "$DMG"
	fi

	# If Homebrew is not installed yet, install it now.

	if [ -z "`which brew`" ]
	then
		echo
		echo '*********************************************************************'
		echo '  ADL Workbench requires GTK+, which we will install using Homebrew.'
		echo '  You do not have Homebrew installed yet.'
		echo '  Installing Homebrew now.'
		echo ' NOTE:'
		echo '  You may be prompted to install the Command Line Developer Tools.'
		echo '  If this happens, then please click the "Install" button.'
		echo '*********************************************************************'
		echo

		rm -rf /usr/local/Cellar /usr/local/.git
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew doctor
	fi

	# Use Homebrew to install GTK+.

	if [ "`brew list 2>&1 | grep 'gtk+'`" != 'gtk+' ]
	then
		echo
		echo '*******************************************************************'
		echo '  ADL Workbench requires GTK+.'
		echo '  You do not have GTK+ installed yet.'
		echo '  Installing GTK+ now.'
		echo '*******************************************************************'
		echo

		brew install gtk+

		# Homebrew uses a version of libiconv that is too old.
		# Force Homebrew to install and use the most recent libiconv.
		brew tap homebrew/dupes
		brew install libiconv
		brew link --force libiconv
	fi

) 2>&1 | tee "$HOME/Library/Logs/ADL Workbench/SetupGTK.log"
