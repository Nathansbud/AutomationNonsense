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
					set currentDir to target of Finder window 1 as alias
				else
					set currentDir to desktop as alias
				end if
				make new file at currentDir with properties {name:(item 1 of templateFile)}
				--set asdadw to POSIX path of (alias of ((currentDir as text) & theName)) --nothing works fml
			end tell
		end if
	on error
		set theFailure to "no, this point"
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

on MakeTemplate(thePath, theName)
	try
		set theLines to {"__pycache__/", ".idea/", "credentials/", "venv/"}
		
		repeat with theItem in theLines
			
		end repeat
	on error
		set adiwaodhaw to "inthefunc"
	end try
end MakeTemplate
