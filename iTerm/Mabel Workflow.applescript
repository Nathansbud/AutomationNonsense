tell application "iTerm"
	set mabelWindow to (create window with default profile)
	tell current session of mabelWindow
		write text "c; Mabel; mabel; webapp; npm start"
	end tell
	tell mabelWindow to set dockerTab to (create tab with default profile)
	select dockerTab
	tell current session of mabelWindow
		write text "c; Mabel; mabel; docker-compose up"
	end tell
	
	tell mabelWindow to set chaliceTab to (create tab with default profile)
	select chaliceTab
	tell current session of mabelWindow
		write text "c; Mabel; mabel; chalice; source venv/bin/activate; chalice local"
	end tell
	tell mabelWindow to set codeTab to (create tab with default profile)
	select codeTab
	tell current session of mabelWindow
		write text "c; Mabel; mabel; code ."
	end tell
end tell