set openSelector to true

on chooseSong(selector, filep)
	set dirPath to POSIX file "/Users/zackamiton/Music/iTunes/iTunes Media/Music/"
	set fileChosen to ""
	if selector then
		set fileChosen to POSIX path of (choose file with prompt "Select a music file:" of type {"MP3", "AAC", "M4A"} default location dirPath)
	else
		set fileChosen to filep
	end if
	set playbackRate to "1.0"
	set dialogResult to (display dialog "Input a playback rate: " default answer "1.0")
	
	try
		set playbackRate to ((text returned of dialogResult) as number)
	on error
		set playbackRate to "1.0"
	end try
	ignoring application responses
		do shell script ("afplay --rate " & playbackRate & " '" & fileChosen & "'")
	end ignoring
end chooseSong

chooseSong(openSelector, "")