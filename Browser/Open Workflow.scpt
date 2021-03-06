JsOsaDAS1.001.00bplist00�Vscript_Jbrowser = Application('Google Chrome');
se = Application('System Events');

browser.includeStandardAdditions = true;
se.includeStandardAdditions = true;

var workflowMap = {
	'Social Media': ["https://messenger.com", "https://youtube.com", "https://reddit.com", "https://instagram.com", "https://twitter.com"],
}

workflow = browser.chooseFromList(Object.keys(workflowMap), {
	withPrompt: "Select Workflow",
	defaultItems: ["Social Media"]
})


if(workflow) {
	sites = workflowMap[workflow]

	browser.Window().make()
	window = browser.windows[0];

	window.tabs[0].url = sites[0]

	for(i = 1; i < sites.length; i++) window.tabs.push(browser.Tab({url: workflowMap[workflow][i]}))

	Application.prototype.switchTab = function(index) { //1-indexed because that's how Chrome works
		if(this.name() == "Google Chrome") {
			this.windows[0].visible = true
			this.windows[0].activeTabIndex = index
			this.windows[0].index = index
			this.activate()
		}
	}

	browser.switchTab(1)
}



/*

browser = Application('Google Chrome');
se = Application('System Events');

browser.includeStandardAdditions = true;
se.includeStandardAdditions = true;



subreddit = browser.displayDialog("Input Subreddit: ", {defaultAnswer: ""})
if(subreddit.textReturned != "") {
	browser.windows[0].tabs.push(browser.Tab({url: "https://reddit.com/r/"+subreddit.textReturned}))
}

*/

                              `jscr  ��ޭ