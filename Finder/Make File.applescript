tell application "Finder"
	if exists Finder window 1 then
		activate
	end if
end tell

tell application "System Events"
	activate
	try
		set templateFile to (choose from list {"File", ".gitignore"} with prompt "Select a Template:" default items "File")
		if templateFile is {"File"} then
			set fn to display dialog "Enter Filename" default answer "" buttons {"Cancel", "Create File (Desktop)", "Create File Here"} default button "Create File Here"
			my FileChosen(fn)
		else
			tell application "Finder"
				set theName to (item 1 of templateFile)
				if (exists Finder window 1) then
					set currentDir to POSIX path of (target of Finder window 1 as alias)
				else
					set currentDir to POSIX path of (path to desktop)
				end if
				
				set createFile to (open for access currentDir & theName with write permission)
				set eof createFile to 0
				
				repeat with theLines in my GetLines(theName)
					write theLines & return to createFile starting at eof
				end repeat
				close access createFile
			end tell
		end if
	on error thisError
		log thisError
	end try
end tell

on FileChosen(fileName)
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
			tell application "System Events" to activate (display dialog "File name too long!")
		else
			make new file at currentDir with properties {name:fp}
		end if
	end tell
end FileChosen


on DoesExist(thePath, theFile)
	set fileTarget to (thePath as text) & (theFile)
	try
		fileTarget as alias
		return true
	on error
		return false
	end try
end DoesExist

on GetLines(theTemplate)
	if theTemplate = ".gitignore" then
		return {"__pycache__/", ".idea/", "credentials/", "venv/"}
	else
		return {}
	end if
end GetLines
