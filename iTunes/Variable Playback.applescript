tell application "iTunes"
	set songLocation to POSIX path of (get (location of selection))
	set playTrackScript to load script ("/Users/zackamiton/Code/AppleScripts/Misc/Play Track (VS, File Select).scpt")
	tell playTrackScript
		chooseSong(false, songLocation)
	end tell
end tell

