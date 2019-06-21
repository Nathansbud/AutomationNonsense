JsOsaDAS1.001.00bplist00�Vscript_;notes = Application('Notes');
se = Application('System Events');

notes.includeStandardAdditions = true;
se.includeStandardAdditions = true;

docs = notes.folders[0].notes;
options = []
accountMap = {}

for(i = 0; i < docs.length; i++) {
	if(docs[i].name() == "Logins") {
		lines = docs[i].body().split("\n");
		accountStart = false;
		sublist = false;
		
		for(j = 0; j < lines.length; j++) {
			if(accountStart) {
				if(lines[j].startsWith("<li>")) {
					if(!lines[j].includes(":")) {
						accountSet = lines[j].substring(4, lines[j].length - 5);
						j++;
					
						while(j < lines.length) {
							if(lines[++j] != "</ul>") {
								options.push(accountSet + " " + lines[j].substring(4, lines[j].length - 5))
							} else {
								break;
							}
						}
					} else {
						options.push(lines[j].substring(4, lines[j].length - 5))
					}					
				}
			}
			if(lines[j] == "<div>Accounts:</div>") {
				accountStart = true;
				j+=1
			}
		}
		
		retVal = se.chooseFromList(options)
		if(retVal != false) {
			se.setTheClipboardTo(retVal.toString());		
		}
		break;
	}
}                              Q jscr  ��ޭ