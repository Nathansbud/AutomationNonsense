if application "Google Chrome" is running then
	tell application "Google Chrome"
		if (count of windows) > 0 and minimized of front window is false then
			try
				set allTabs to every tab of the front window
				set activeTab to the front window's active tab
				
				repeat with theTab in allTabs
					if the id of theTab is not the id of activeTab then
						tell theTab to close
					else
						exit repeat
					end if
				end repeat
			on error
				log "No tab ~ exists ~"
			end try
		end if
	end tell
end if



