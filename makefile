.SILENT: run
apply:
	git pull
	stow --adopt .
	git restore .
update:
	git pull
	git add .
	git commit -m "update dotfiles"
	git push
