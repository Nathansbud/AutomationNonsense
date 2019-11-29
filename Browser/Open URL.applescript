tell application "Google Chrome"
	set gotoInfo to display dialog "Enter URL" default answer "" buttons {"Cancel", "Site", "Search"} default button {"Search"}
	if button returned of gotoInfo is "Site" then
		set tr to (text returned of gotoInfo)
		if my ContainsEnding(tr) then
			if tr starts with "http" then
				open location tr
			else
				open location "https://" & tr
			end if
		else if tr starts with "/r/" then
			open location "https://reddit.com" & tr
		else
			open location "https://" & tr & ".com"
		end if
		
	else if button returned of gotoInfo is "Search" then
		open location "https://google.com/search?q=" & (text returned of gotoInfo)
	end if
end tell

on ContainsEnding(urlText)
	set urlEndings to {".com", ".net", ".edu"}
	repeat with urlEnding in urlEndings
		if urlText contains urlEnding then
			return true
		end if
	end repeat
	return false
end ContainsEnding