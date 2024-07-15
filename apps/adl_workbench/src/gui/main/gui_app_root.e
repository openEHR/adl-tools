note
	component:   "openEHR ADL Tools"
	description: "Main Application"
	keywords:    "Application root class"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_APP_ROOT

inherit
	EV_APPLICATION

	SHARED_APP_ROOT
		export
			{NONE} all;
			{ANY} app_root
		undefine
			copy, default_create
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

create
	make_and_launch

feature {NONE} -- Initialization

	make_and_launch
			-- Create and launch the application
		do
			default_create
			if not is_destroyed then
				if attached {ICON_RESOURCES_COMPILED} icon_resources.item as comp_icon_resources then
					comp_icon_resources.add_icons (create {APP_ICON_RESOURCES})
				end
				message_db.add_table (create {EVX_MESSAGES_DB}.make)
				create splash.make_with_shadow
				post_launch_actions.extend_kamikaze (agent app_launch)
				launch
			end
		end

	app_launch
		do
			splash.show
			process_events
			app_root.initialise_shell
			app_root.initialise_cfg
			if app_root.ready_to_initialise_app then
				app_root.initialise_app
				process_graphical_events
				create main_window

				main_window.show
				splash.destroy
			else
				io.put_string (app_root.errors.as_string)
			end
		end

	main_window: detachable MAIN_WINDOW
		note
			option: stable
		attribute
		end

	splash: detachable SPLASH_WINDOW
		note
			option: stable
		attribute
		end

end


