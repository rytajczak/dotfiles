install:
	pacman -S
apply:
	git pull
	stow --adopt .
	git restore .
