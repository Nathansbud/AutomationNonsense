on getPosition(theItem, theList)
	repeat with i from 1 to the count of theList
		if item i of theList is theItem then return i
	end repeat
	return 0
end getPosition --Doesn't seem to work?


tell application "Notes"
	set allNotes to notes in folder "Notes"
	set noteNames to {}
	
	repeat with noteItem in allNotes
		set noteNames to noteNames & (get the name of noteItem)
	end repeat
	set nameOfNoteChosen to choose from list noteNames with prompt "Choose a Note:" default items {"None"}
	set noteChosen to ""
	--getPosition(nameOfNoteChosen as string, noteNames)
	if nameOfNoteChosen is not false then
		repeat with i from 1 to the count of allNotes
			if (get name of item i of allNotes) is (nameOfNoteChosen as string) then
				set noteChosen to item i of allNotes
			end if
		end repeat
		get body of noteChosen
	end if
end tell

