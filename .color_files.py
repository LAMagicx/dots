# vim:foldmethod=indent:foldlevel=0
EXE=[
    '*.tar',
    '*.tgz',
    '*.arc',
    '*.arj',
    '*.taz',
    '*.lha',
    '*.lz4',
    '*.lzh',
    '*.lzma',
    '*.tlz',
    '*.txz',
    '*.tzo',
    '*.t7z',
    '*.zip',
    '*.z',
    '*.dz',
    '*.gz',
    '*.lrz',
    '*.lz',
    '*.lzo',
    '*.xz',
    '*.zst',
    '*.tzst',
    '*.bz2',
    '*.bz',
    '*.tbz',
    '*.tbz2',
    '*.tz',
    '*.deb',
    '*.rpm',
    '*.jar',
    '*.war',
    '*.ear',
    '*.sar',
    '*.rar',
    '*.alz',
    '*.ace',
    '*.zoo',
    '*.cpio',
    '*.7z',
    '*.rz',
    '*.cab',
    '*.wim',
    '*.swm',
    '*.dwm',
    '*.esd'
]
IMG=[
    '*.jpg',
    '*.jpeg',
    '*.mjpg',
    '*.mjpeg',
    '*.gif',
    '*.bmp',
    '*.pbm',
    '*.pgm',
    '*.ppm',
    '*.tga',
    '*.xbm',
    '*.xpm',
    '*.tif',
    '*.tiff',
    '*.png',
    '*.svg',
    '*.svgz',
    '*.mng',
    '*.pcx',
    '*.mov',
    '*.mpg',
    '*.mpeg',
    '*.m2v',
    '*.mkv',
    '*.webm',
    '*.webp',
    '*.ogm',
    '*.mp4',
    '*.m4v',
    '*.mp4v',
    '*.vob',
    '*.qt',
    '*.nuv',
    '*.wmv',
    '*.asf',
    '*.rm',
    '*.rmvb',
    '*.flc',
    '*.avi',
    '*.fli',
    '*.flv',
    '*.gl',
    '*.dl',
    '*.xcf',
    '*.xwd',
    '*.yuv',
    '*.cgm',
    '*.emf',
    '*.ogv',
    '*.ogx'
]
MP3=[
    '*.aac',
    '*.au',
    '*.flac',
    '*.m4a',
    '*.mid',
    '*.midi',
    '*.mka',
    '*.mp3',
    '*.mpc',
    '*.ogg',
    '*.ra',
    '*.wav',
    '*.oga',
    '*.opus',
    '*.spx',
    '*.xspf'
]

CUSTOM_COLORS = [
        "*.py=32:",
        "*.conf=4;33:",
        "*.pdf=01;96:",
        "*.hs=1;35:"
]

LS_COLORS = "rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=02;96:st=37;44:ex=01;32:"

for c in CUSTOM_COLORS:
    LS_COLORS += c

for c in EXE:
    LS_COLORS += c+"=01;31:"

for c in IMG:
    LS_COLORS += c+"=01;34:"

for c in MP3:
    LS_COLORS += c+"=0;34:"

if __name__ == "__main__":
    print(LS_COLORS)

