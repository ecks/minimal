M=modules

all:
	@make clean
	@make minimal

clean:
	rm -f minimal.zsh-theme

minimal:
	rm -f minimal.zsh-theme
	@echo "making minimal.zsh-theme"
	@for f in \
		$M/defaults.zsh \
		$M/user.zsh \
		$M/jobs.zsh \
		$M/status.zsh \
		$M/path.zsh \
		$M/git.zsh \
		$M/vimode.zsh \
		prompt.zsh; \
	do \
		(cat $$f; echo) >> minimal.zsh-theme; \
	done;

minimal-path-host:
	rm -f $B/$@.zsh-theme
	@echo "making $B/$@.zsh-theme"
	@for f in \
		$M/defaults.zsh \
		$M/user.zsh \
		$M/jobs.zsh \
		$M/status.zsh \
	 	$M/path.zsh \
		$M/host.zsh \
		prompt-$@.zsh; \
	do \
		(cat $$f; echo) >> $@.zsh-theme; \
	done;	
