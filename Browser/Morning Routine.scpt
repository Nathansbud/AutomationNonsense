JsOsaDAS1.001.00bplist00�Vscript_�browser = Application('Google Chrome');
browser.includeStandardAdditions = true;

browser.Window().make()

var sites = ["https://messenger.com", "https://youtube.com", "https://reddit.com", "https://instagram.com", "https://twitter.com"]

window = browser.windows[0];
window.tabs[0].url = sites[sites.length - 1];

for(i = sites.length - 2; i > -1; i--) {
	window.tabs.push(browser.Tab({url: sites[i]}))
}

                              � jscr  ��ޭ