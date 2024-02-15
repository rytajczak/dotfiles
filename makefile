apply:
	git stash && git stash clear
	git pull
	stow --adopt *
	git restore .

