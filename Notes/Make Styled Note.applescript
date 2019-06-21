tell application "Notes"
	set noteList to notes
	
	set backgroundColor to "#00FF00"
	set textColor to "#ffa500"
	set noteBody to "<html>
<head>
<style type=\"text/css\">
div.background{background-color:" & backgroundColor & ";}ol, ul, li, p{color:" & textColor & "}
</style>
</head>
<body style=\"color:" & textColor & ";\">New Note
<div class=\"background\"></div>
</body>
</html>"
	
	make new note at folder "Notes" with properties {name:"Test Note", body:noteBody}
end tell