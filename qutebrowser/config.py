# config do catppuccin
import os
from urllib.request import urlopen

config.load_autoconfig()

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'macchiato', True)

# plugin bitwarden
config.bind('ps', 'spawn --userscript bitwarden', mode='normal')

# dark mode setup
# c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

c.zoom.default = "115%"
c.tabs.show = 'always'
c.url.start_pages = ['google.com']
c.fonts.default_size = '11pt'
# c.fonts.completion.entry = "11pt Noto Sans"
# c.fonts.completion.category = "bold 11pt Noto Sans"
# c.fonts.debug_console = "11pt Noto Sans"
# c.fonts.downloads = "11pt Noto Sans"
# c.fonts.hints = "bold 11pt Noto Sans"
# c.fonts.keyhint = "11pt Noto Sans"
# c.fonts.messages.error = "11pt Noto Sans"
# c.fonts.messages.info = "11pt Noto Sans"
# c.fonts.messages.warning = "11pt Noto Sans"
# c.fonts.prompts = "11pt Noto Sans"
# c.fonts.statusbar = "11pt Noto Sans"
c.fonts.tabs.selected = "11pt JetBrainsMono"
c.fonts.tabs.unselected = "11pt JetBrainsMono"

config.bind('gh', 'tab-move -')
config.bind('gl', 'tab-move +')
config.bind('x', 'tab-close')
config.bind('1t', 'tab-select 1')
config.bind('2t', 'tab-select 2')
config.bind('3t', 'tab-select 3')
config.bind('4t', 'tab-select 4')
config.bind('5t', 'tab-select 5')
config.bind('6t', 'tab-select 6')
config.bind('7t', 'tab-select 7')
config.bind('8t', 'tab-select 8')
config.bind('9t', 'tab-select 9')
config.unbind('gm')
config.bind('gm1', 'tab-move 1')
config.bind('gm2', 'tab-move 2')
config.bind('gm3', 'tab-move 3')
config.bind('gm4', 'tab-move 4')
config.bind('gm5', 'tab-move 5')
config.bind('d', 'scroll-page 0 0.5', mode='normal')
config.bind('u', 'scroll-page 0 -0.5', mode='normal')
config.bind('<Ctrl-k>', 'tab-prev')
config.bind('<Ctrl-j>', 'tab-next')

# Estilos da aba
c.tabs.padding = {'top': 8, 'bottom': 8, 'left': 8, 'right': 5} # Aumenta o preenchimento para mais espaço
c.tabs.indicator.width = 0 # Largura do indicador de carregamento
c.tabs.favicons.scale = 1.0 # Tamanho dos favicons

# tema catppuccin nao configura isso por padrão
c.colors.tabs.pinned.even.bg = "#5b6078"
c.colors.tabs.pinned.odd.bg = "#494d64"

# Formato do título da aba - REMOVEMOS '{title_sep}{title}'
# Agora só mostra o áudio (se houver), o índice e o host.
c.tabs.title.format = '{audio}{index}. {host}'
c.tabs.title.format_pinned = '' # Formato do título da aba fixada
c.tabs.max_width = 200 # Largura máxima da aba para evitar que fiquem muito grandes

c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    '!a':       'https://www.amazon.com/s?k={}',
    '!d':       'https://duckduckgo.com/?ia=web&q={}',
    '!e':       'https://www.ebay.com/sch/i.html?_nkw={}',
    '!gh':      'https://github.com/search?o=desc&q={}&s=stars',
    '!gist':    'https://gist.github.com/search?q={}',
    '!gi':      'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    '!m':       'https://www.google.com/maps/search/{}',
    '!w':       'https://en.wikipedia.org/wiki/{}',
    '!yt':      'https://www.youtube.com/results?search_query={}'
}

#
# Adblocking info -->
# For yt ads: place the greasemonkey script yt-ads.js in your greasemonkey folder (~/.config/qutebrowser/greasemonkey).
# The script skips through the entire ad, so all you have to do is click the skip button.
# Yeah it's not ublock origin, but if you want a minimal browser, this is a solution for the tradeoff.
# You can also watch yt vids directly in mpv, see qutebrowser FAQ for how to do that.
# If you want additional blocklists, you can get the python-adblock package, or you can uncomment the ublock lists here.
c.content.blocking.enabled = True
c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
        "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"]
