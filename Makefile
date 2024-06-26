
PACKAGES_FILE = packages.txt

PACKAGES = $(shell cat $(PACKAGES_FILE))

all: update install

update:
	sudo apt-get update

install: install-packages install-fonts install-bspwm\ 
        install-sxhkdrc install-polybar install-xinitrc\ 
		install-kitty

clean:
	sudo apt-get autoremove -y
	sudo apt-get clean


full: update install clean


install-packages:
	sudo apt-get install -y $(PACKAGES)

install-bspwm:
	mkdir -p ~/.config/bspwm
	rm -f ~/.config/bspwm/bspwmrc
	ln -s `pwd`/config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
	chmod +x ~/.config/bspwm/bspwmrc

install-sxhkdrc:
	mkdir -p ~/.config/sxhkd
	rm -f ~/.config/sxhkd/sxhkdrc
	ln -s `pwd`/config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

install-polybar:
	mkdir -p ~/.config/polybar
	rm -f ~/.config/polybar/config
	rm -f ~/.config/polybar/launch.sh
	ln -s `pwd`/config/polybar/launch.sh ~/.config/polybar/launch.sh
	ln -s `pwd`/config/polybar/config ~/.config/polybar/config
	chmod +x ~/.config/polybar/launch.sh

install-xinitrc:
	ln -s `pwd`/config/xinitrc ~/.xinitrc
	chmod +x ~/.xinitrc
	startx

install-fonts:
	mkdir -p ~/.fonts
	rm -f ~/.fonts/Inconsolata\ Nerd\ Font\ Complete\ Mono.otf
	ln -s `pwd`/fonts/Inconsolata\ Nerd\ Font\ Complete\ Mono.otf \
		~/.fonts/Inconsolata\ Nerd\ Font\ Complete\ Mono.otf

install-kitty:
	mkdir -p ~/.config/kitty
	rm -f ~/.config/kitty/kitty.conf
	ln -s `pwd`/config/kitty/kitty.conf ~/.config/kitty/kitty.conf