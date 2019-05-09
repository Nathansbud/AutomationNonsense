set appList to {"PyCharm", "IntelliJ Idea", "iTunes", "Terminal", "GitHub Desktop", "Safari", "Google Chrome", "Discord", "Firefox Developer Edition"} --come up with a better way to do this by quitting ALL apps

set whitelist to {"Script Editor"}

--tell application "System Events"
--	repeat with processID in appList
--		if processID is not in whitelist then
--			if unix id of processID is in processes then
--				do shell script "kill -9 " & unix id of process processID
--			end if
--		end if
--	end repeat
--end tell

repeat with theApp in appList
	tell application theApp to quit
end repeat

do shell script "sudo ~/Code/PythonNonsense/site_blocker.py"

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
