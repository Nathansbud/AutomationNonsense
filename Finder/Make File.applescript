tell application "Finder"
	if exists Finder window 1 then
		activate
	end if
end tell

tell application "System Events"
	activate
	try
		set fileName to display dialog "Enter Filename" default answer "" buttons {"Cancel", "Create File (Desktop)", "Create File Here"} default button "Create File Here"
	on error
		return
	end try
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
	
	if length of fp > 255 then
		tell application "System Events" to activate display dialog "File name too long!"
	else
		make new file at currentDir with properties {name:fp}
	end if
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


