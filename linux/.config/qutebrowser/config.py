config.load_autoconfig(False)

c.aliases = {
    'q': "quit",
    'o': "open",
    'l': "quickmark-load",
    'c': "history-clear",
    'p': "open --private",
}

config.bind('m', "hint links spawn --detach mpv --force-window yes {hint-url}")
config.bind('i', "hint images spawn --output-message wget -P '/home/nzv/.local/cache/imgs' {hint-url}")
#c.content.private_browsing = True
#c.content.webgl = False
c.content.canvas_reading = False
c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0"
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "https://easylist.to/easylist/fanboy-social.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://www.i-dont-care-about-cookies.eu/abp/",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
]
#c.content.javascript.enabled = False
c.content.javascript.can_access_clipboard = True
c.content.geolocation = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.tabs.show = "never"
c.content.pdfjs = True
c.spellcheck.languages = ["en-US"]
c.zoom.default = "65%"
c.input.insert_mode.auto_load = True
c.content.autoplay = False
c.statusbar.show = "never"
c.auto_save.session = False
c.hints.mode = "number"
c.editor.command = ['alacritty', '-e', 'nvim', '{file}']
c.url.default_page = "https://search.brave.com"
c.url.start_pages  = c.url.default_page
config.set("fileselect.handler", "external")
config.set("fileselect.single_file.command", ['alacritty', '--class', 'lf,lf', '-e', 'lf', '-selection-path', '{}'])
config.set("fileselect.multiple_files.command", ['alacritty', '--class', 'lf,lf', '-e', 'lf', '-selection-path', '{}'])
c.downloads.location.directory = '~/.local/cache/wget'
c.url.searchengines = {
    'DEFAULT': 'https://search.brave.com/search?q={}',
          't': 'https://www.twitch.tv/{}',
          'g': 'https://pkg.go.dev/search?q={}',
          'w': 'https://wiki.gentoo.org/wiki/{}',
          'y': 'https://www.youtube.com/results?q={}',
          'i': 'http://libgen.rs/search.php?req={}',
}

# Colorscheme based on OceanicNext
base00 = "#1D1F21"
base01 = "#343D46"
base02 = "#4F5B66"
base03 = "#1D1F21"
base04 = "#A7ADBA"
base05 = "#C0C5CE"
base06 = "#CDD3DE"
base07 = "#D8DEE9"
base08 = "#EC5f67"
base09 = "#F99157"
base0A = "#FAC863"
base0B = "#99C794"
base0C = "#5FB3B3"
base0D = "#6699CC"
base0E = "#C594C5"
base0F = "#AB7967"

c.colors.completion.fg = base05
c.colors.completion.odd.bg = base03
c.colors.completion.even.bg = base00
c.colors.completion.category.fg = base0A
c.colors.completion.category.bg = base00
c.colors.completion.category.border.top = base00
c.colors.completion.category.border.bottom = base00
c.colors.completion.item.selected.fg = base01
c.colors.completion.item.selected.bg = base0A
c.colors.completion.item.selected.border.top = base0A
c.colors.completion.item.selected.border.bottom = base0A
c.colors.completion.item.selected.match.fg = base08
c.colors.completion.match.fg = base0B
c.colors.completion.scrollbar.fg = base05
c.colors.completion.scrollbar.bg = base00
c.colors.downloads.bar.bg = base00
c.colors.downloads.start.fg = base00
c.colors.downloads.start.bg = base0D
c.colors.downloads.stop.fg = base00
c.colors.downloads.stop.bg = base0C
c.colors.downloads.error.fg = base08
c.colors.hints.fg = base00
c.colors.hints.bg = base0A
c.colors.hints.match.fg = base05
c.colors.keyhint.fg = base05
c.colors.keyhint.suffix.fg = base05
c.colors.keyhint.bg = base00
c.colors.messages.error.fg = base00
c.colors.messages.error.bg = base08
c.colors.messages.error.border = base08
c.colors.messages.warning.fg = base00
c.colors.messages.warning.bg = base0E
c.colors.messages.warning.border = base0E
c.colors.messages.info.fg = base05
c.colors.messages.info.bg = base00
c.colors.messages.info.border = base00
c.colors.prompts.fg = base05
c.colors.prompts.border = base00
c.colors.prompts.bg = base00
c.colors.prompts.selected.bg = base0A
c.colors.statusbar.normal.fg = base0B
c.colors.statusbar.normal.bg = base00
c.colors.statusbar.insert.fg = base00
c.colors.statusbar.insert.bg = base0D
c.colors.statusbar.passthrough.fg = base00
c.colors.statusbar.passthrough.bg = base0C
c.colors.statusbar.private.fg = base00
c.colors.statusbar.private.bg = base03
c.colors.statusbar.command.fg = base05
c.colors.statusbar.command.bg = base00
c.colors.statusbar.command.private.fg = base05
c.colors.statusbar.command.private.bg = base00
c.colors.statusbar.caret.fg = base00
c.colors.statusbar.caret.bg = base0E
c.colors.statusbar.caret.selection.fg = base00
c.colors.statusbar.caret.selection.bg = base0D
c.colors.statusbar.progress.bg = base0D
c.colors.statusbar.url.fg = base05
c.colors.statusbar.url.error.fg = base08
c.colors.statusbar.url.hover.fg = base05
c.colors.statusbar.url.success.http.fg = base0C
c.colors.statusbar.url.success.https.fg = base0B
c.colors.statusbar.url.warn.fg = base0E
c.colors.tabs.bar.bg = base00
c.colors.tabs.indicator.start = base0D
c.colors.tabs.indicator.stop = base0C
c.colors.tabs.indicator.error = base08
c.colors.tabs.odd.fg = base05
c.colors.tabs.odd.bg = base03
c.colors.tabs.even.fg = base05
c.colors.tabs.even.bg = base00
c.colors.tabs.pinned.even.bg = base0C
c.colors.tabs.pinned.even.fg = base07
c.colors.tabs.pinned.odd.bg = base0B
c.colors.tabs.pinned.odd.fg = base07
c.colors.tabs.pinned.selected.even.bg = base05
c.colors.tabs.pinned.selected.even.fg = base00
c.colors.tabs.pinned.selected.odd.bg = base05
c.colors.tabs.pinned.selected.odd.fg = base0E
c.colors.tabs.selected.odd.fg = base00
c.colors.tabs.selected.odd.bg = base05
c.colors.tabs.selected.even.fg = base00
c.colors.tabs.selected.even.bg = base05

# Fonts
font_default = '8pt CozetteVector'
c.fonts.default_family = 'CozetteVector'
c.fonts.default_size = '8pt'
c.fonts.completion.entry = font_default
c.fonts.debug_console = font_default
c.fonts.prompts = font_default
c.fonts.statusbar = font_default
