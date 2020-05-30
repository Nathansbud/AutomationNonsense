-- 1 = Uni, 2 = Personal, 3 = ICS
tell application "System Events"
	set currentApp to name of first application process whose frontmost is true
	if "Google Chrome" is not in currentApp then
		activate
		set profileChoices to {"Brown", "Personal", "ICS"}
		set profileChosen to (choose from list profileChoices with prompt "Choose a Chrome Account" default items "Brown")
		if profileChosen is not false then
			set profileIndex to my indexOf(profileChosen, profileChoices)
			do shell script "open -a \"Google Chrome\" -n --args --profile-directory=\"Profile " & profileIndex & "\""
		end if
	else
		activate
		set theTabs to {}
		tell application "Google Chrome"
			repeat with t in tabs of windows
				copy the URL of t to the end of theTabs
			end repeat
		end tell
		
		set profileChoices to {"Brown", "Personal", "ICS"}
		set profileChosen to (choose from list profileChoices with prompt "Choose a Chrome Account" default items "Brown")
		if profileChosen is not false then
			set profileIndex to my indexOf(profileChosen, profileChoices)
			do shell script "open -a \"Google Chrome\" -n --args --profile-directory=\"Profile " & profileIndex & "\""
			delay 1 -- might be kinda sloppy
			tell application "Google Chrome"
				activate
				repeat with t in theTabs
					open location t
				end repeat
			end tell
		end if
	end if
end tell


on indexOf(theItem, theList)
	repeat with i from 1 to the count of theList
		-- theItem is item i of the list doesn't work because...AppleScript? Per ushe?
		if theItem contains item i of theList then return i
	end repeat
	return 0
end indexOf

