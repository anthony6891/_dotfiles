
PACKAGES_FILE = packages.txt

PACKAGES = $(shell cat $(PACKAGES_FILE))

all: update install

update:
	sudo apt-get update

install: install-packages \
	install-fonts \
	install-bspwm \
	install-sxhkdrc \
	install-polybar \
	install-Xsession \
	install-kitty \
	install-rofi \
	install-tmux \
	install-desktop \
	install-vscode

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

install-Xsession:
	rm -f ~/.xsession
	ln -s `pwd`/config/Xsession ~/.xsession

install-fonts:
	mkdir -p ~/.fonts
	rm -f ~/.fonts/Inconsolata\ Nerd\ Font\ Complete\ Mono.otf
	ln -s `pwd`/fonts/Inconsolata\ Nerd\ Font\ Complete\ Mono.otf \
		~/.fonts/Inconsolata\ Nerd\ Font\ Complete\ Mono.otf

install-kitty:
	mkdir -p ~/.config/kitty
	rm -f ~/.config/kitty/kitty.conf
	ln -s `pwd`/config/kitty/kitty.conf ~/.config/kitty/kitty.conf

install-rofi:
	mkdir -p ~/.config/rofi
	rm -f ~/.config/rofi/config.rasi
	rm -f ~/.config/rofi/arc_dark_transparent_colors.rasi
	rm -f ~/.config/rofi/arc_dark_colors.rasi
	ln -s `pwd`/config/rofi/config.rasi ~/.config/rofi/config.rasi

install-tmux:
	rm -f ~/.tmux.conf
	rm -f ~/.tmux-colors
	ln -s `pwd`/config/tmux/tmux-colors ~/.tmux-colors
	ln -s `pwd`/config/tmux/tmux.conf ~/.tmux.conf

install-desktop:
	mkdir -p ~/.config/desktop/
	rm -f ~/.config/desktop/background.jpg
	ln -s `pwd`/images/eva01.jpg ~/.config/desktop/background.jpg
	mkdir -p ~/.local/share/applications
	rm -f ~/.local/share/applications/mimeinfo.cache
	ln -s `pwd`/config/mime/mimeinfo.cache ~/.local/share/applications/mimeinfo.cache

install-vscode:
	mkdir -p ~/.config/vscode/
	rm -f ~/.config/vscode/install_vscode.sh
	rm -f ~/.config/vscode/install_extensions.sh
	rm -f ~/.config/Code/User/settings.json
	ln -s `pwd`/config/vscode/install_vscode.sh ~/.config/vscode/install_vscode.sh
	ln -s `pwd`/config/vscode/install_extensions.sh ~/.config/vscode/install_extensions.sh
	chmod +x ~/.config/vscode/install_vscode.sh
	chmod +x ~/.config/vscode/install_extensions.sh
	sh ~/.config/vscode/install_vscode.sh
	ln -s `pwd`/config/vscode/settings.json ~/.config/Code/User/settings.json
	sh ~/.config/vscode/install_extensions.sh

config-screenlayout:
	mkdir -p ~/.config/screenlayout
	rm -f ~/.config/screenlayout/test_virtualbox.sh
	ln -s `pwd`/config/screenlayout/test_virtualbox.sh ~/.screenlayout/test_virtualbox.sh
	chmod +x ~/.config/screenlayout/test_virtualbox.sh