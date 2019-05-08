tell application "iTunes"
	if ((count of items in selection) > 0) or (player state is playing) then
		set sel to {}
		if (count of items in selection) > 0 then
			copy selection to sel
		else if player state is playing then
			copy current track to the end of sel
		end if
		
		set sum to 0
		set play_count to 0
		repeat with t in sel
			set sum to sum + ((get duration of t) * (get played count of t)) -- time in seconds
			set play_count to play_count + (get played count of t)
		end repeat
		
		set minutes to (sum / 60)
		set hours to (sum / 3600)
		set days to (sum / 86400)
		if length of sel > 1 then
			set refer to "these " & length of sel & " songs a total of "
		else
			set refer to "'" & name of sel's item 1 & "' "
		end if
		
		if play_count is 1 then
			set refer to refer & play_count & " time!"
		else
			set refer to refer & play_count & " times!"
		end if
		
		display alert "You've listened to  " & refer & " That's...
		- " & sum & " seconds,
		- " & minutes & " minutes,
		- " & hours & " hours, and
		- " & days & " days!"
	else
		display alert "You can't run this script because you haven't selected a song! Let's fix that for ya..."
		play
	end if
end tell
