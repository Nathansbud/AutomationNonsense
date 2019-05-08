use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "iTunes"
	set bangers to name of every track of playlist "Beloved Bangers"
	back track
	play (track (item (random number from 1 to length of bangers) of bangers))
end tell