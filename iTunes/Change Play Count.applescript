tell application "iTunes"
	set sel to selection
	repeat with t in sel
		set dialog_answers to display dialog "Enter a new play count for " & name of t & ":" default answer ""
		set new_count to text returned of dialog_answers as integer
		if button returned of dialog_answers is "OK" then
			set played count of t to new_count
		end if
	end repeat
end tell
