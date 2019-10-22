set hasWindow to false

tell application "Preview"
	if exists window 1 then
		activate
		set imagePath to POSIX path of (path of document of front window as POSIX file as alias)
		set hasWindow to true
	else
		quit
	end if
end tell

if hasWindow then
	tell application "System Events"
		try
			set rotateDialog to display dialog "Rotate Degrees" default answer "" buttons {"Cancel", "Rotate To", "Rotate By"} default button "Rotate"
			set rotateDegrees to text returned of rotateDialog as number
			do shell script "sips -r " & rotateDegrees & " " & imagePath
			tell application "Preview" to activate
		on error
			return
		end try
	end tell
end if
