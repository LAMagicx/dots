## Alias section 
alias cp="cp -i"                                                                                # Confirm before overwriting something
alias df='df -h'                                                                                # Human-readable sizes
alias free='free -m'                                                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'                                                # master git thingy
alias grep='grep --color=auto'                                                                  # more color
alias egrep='egrep --color=auto'                                                                # more color
alias fgrep='fgrep --color=auto'                                                                # more color
alias more=less                                                                                 # not sure  
alias ls='ls --color -holX --group-directories-first'                                           # main ls
alias sl='ls'
alias python=python3                                                                            # python 2/3 fix 
#alias gcc='gcc -Werror -Wall -Wextra -pedanticpedantic'                                        # C compliling
alias cd..='cdcd ..'                                                                            # Spelling
alias dir='dir --color=auto'                                                                    # more color
    alias clsa='clear && source ~/.zshrc'                                                       # clear +   reload
alias cls='clear && neofetch'                                                                   # clear
alias binary='xxd -g'                                                                           # nicer binary
alias goodbye='pkill -KILL -u magic'                                                            # logout
alias murder='kill -9 $(jobs -p)'                                                               # kill all jobs
alias rc='vim ~/.config/awesome/rc.lua'                                                         # open rc.lua
alias open='xdg-open'                                                                           # shorten
alias zs='vim ~/.zshrc'                                                                         # open .zshrc
alias gst='git status -s'                                                                       # nice git status
alias pacupg='sudo pacman -Syu'                                                                 # pacman upgrade 
alias pacin='sudo pacman -S'                                                                    # pacman install
alias pacrm='sudo pacman -R'                                                                    # pacman remove
alias pipin='pip install'                                                                       # python pip install
alias ccat="colorize_cat"                                                                       # colored cat 
alias cless="colorize_less"                                                                     # colored less
alias vs='vim ~/.vimrc'                                                                         # open vimrc
alias va='vim ~/.zsh_files/aliases.zsh'                                                         # open this page
alias vip='vim -u ~/.vim/vimrcplug'
alias screen='xrandr --output HDMI1 --auto --primary --right-of eDP1'                           # reset screens
alias pytohn='python'                                                                           # spelling
alias pyotnh='python'                                                                           # spelling
alias psa='ps -el | grep '                                                                      # proccess finding
alias fr='setxkbmap fr'                                                                         # really ?
alias gb='setxkbmap gb'                                                                         # you sure ?
alias swifi='nmcli device wifi list'                                                            # show availble wifis
alias cwifi='nmcli device wifi connect'                                                         # connect to wifi
#alias sp='~/sp'                                                                      # spoitfy client
alias lock='betterlockscreen -l dim -- --layout-pos="ix-1000:iy+1000"'                                                                          # lock screen
alias sbms='sudo systemctl start smb nmb'                                                       # start samba server 
alias suspend='sudo /usr/lib/systemd/systemd-sleep suspend'                                     # suspend the system
alias sscrot="scrot '%d-%m_capture.png' -sfz -e 'python ~/Pictures/imager.py %d-%m_capture.png'" # scrot image mover + renamer
alias blueon='bluetoothctl power    on'                                                         # power bluetooth on
alias sysc='systemctlsystemctl'                                                                 # shorten systemctl
alias lon='xsetxset led 2 led on'                                                               # turn led on
alias lof='xset led 2 led off'                                                                  # turn led off
alias b2='xrandr --output HDMI-1 --brightness'                                                  # change monitor brightness
alias b1='xrandr --output eDP-1 --brightness'                                                  # change monitor brightness
#alias rm='trash'                                                                                # no more deleting important notes
#alias RM='rm'                                                                                   # see above
alias mkles='~/.local/bin/mkles'                                                                # alias for make lessons
alias money='~/Files/Procastination/Crypto/tracker.py'                                          # cryto tracker
alias qlocate='rg -rnw . -e '                                                                    # finder
alias locate='find -name '                                                                  # find slow
alias gitsave='git config --local credential.helper store'                                      # save local git password + username
alias pjson='python -m json.tool'                                                          # pretty json
alias haskell='runhaskell'                                                                      # run haskell
alias yays='yay -S'                                                                             # yay istall
alias clip='xclip -selection clipboard'                                                         # copy from file
alias startvnc='ssh -t -L 5900:localhost:5900 192.168.1.21 "x11vnc -localhost -display :0"'
alias connectvnc='vncviewer -PreferredEncoding=ZRLE localhost:0'
alias ssup='ssh magicserv -t "up"'
alias ssdo='ssh magicserv -t "down"'
alias gitc='git commit -m'
alias ala='cd ~/.config/alacritty/ && vim alacritty.yml'
alias flex="genact"
alias ctags="ctags -R"
alias sexy="echo 'who | grep -i blonde | date; cd ~; unzip; \n touch; strip; finger; mount; gasp; yes \n  uptime; umount; sleep'"
alias mon="xinput enable 14"
alias moff="xinput disable 14"
alias changebg="cd ~/Gits/Mine/background-quote-genereator; ./script.py"
alias yolo='git add -A; git commit -m "$(curl -s http://whatthecommit.com/index.txt)"; git push'
