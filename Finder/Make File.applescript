tell application "Finder"
	if exists Finder window 1 then
		activate
	end if
end tell

tell application "System Events"
	set fileName to display dialog "Enter Filename" default answer "" buttons {"Cancel", "Create File (Desktop)", "Create File Here"} default button "Create File Here"
end tell

tell application "Finder"
	if (exists Finder window 1) and button returned of fileName is "Create File Here" then
		set currentDir to target of Finder window 1 as alias
	else
		set currentDir to desktop as alias
	end if
	
	set fp to text returned of fileName
	repeat while my DoesExist(currentDir, fp)
		set fp to "New " & fp
	end repeat
	make new file at currentDir with properties {name:fp}
end tell

on DoesExist(thePath, theFile)
	set fileTarget to (thePath as text) & (theFile)
	try
		fileTarget as alias
		return true
	on error
		return false
	end try
end DoesExist



