tell application "iTunes"
	set songLocation to POSIX path of (get (location of selection))
	set playTrackScript to load script ("/Users/zackamiton/Code/AutomationNonsense/Misc/Play Track (VS, File Select).applescript")
	tell playTrackScript
		chooseSong(false, songLocation)
	end tell
end tell

