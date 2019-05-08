use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "iTunes"
	set s to current track
	set dateDif to ((current date) - (date added of s)) -- difference between now and added date, in seconds
	set dateScore to ((played count of s) / (dateDif)) * 1.0E+6 -- 10^6 because dateDif is in seconds and the number is ABSURDLY small
	set playedScore to ((played count of s) / (skipped count of s)) -- ratio of plays to skips
	set score to (dateScore + playedScore)
	
	display alert (name of s) & " has a song score of " & score & "! 
- Added: " & (date string of (get date added of s)) & "
- Plays to Skips: " & (played count of s) & ":" & (skipped count of s)
end tell