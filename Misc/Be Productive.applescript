set appList to {"PyCharm", "IntelliJ Idea", "iTunes", "Terminal", "GitHub Desktop", "Safari", "Google Chrome", "Discord", "Firefox Developer Edition"} --come up with a better way to do this by quitting ALL apps

set whitelist to {"Script Editor"}

repeat with a in appList
	if a is not in whitelist then
		tell application a to quit
	end if
end repeat

tell application "Notes"
	activate
	set x to notes of folder "Notes"
	
	repeat with n in x
		if name of n is "Assignment Directory" then
			show n
			exit repeat
		end if
	end repeat
end tell
