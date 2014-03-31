#!/bin/bash

if [ $# -gt 1 ] && [ $1 == 'generate' ];
then
	# create tmuxinator file
	tmux_file=$HOME/.tmuxinator/$2.yml;
	cat $HOME/.tmuxinator/.base.yml | sed s/{project_name}/$2/ | sed s^{code_dir}^$CODE_DIR^ > $tmux_file;

	#create alias to start tmuxinator project
	echo -e "alias $2='tmux $2'" >> $HOME/.bash_aliases.local
	. $HOME/.bash_aliases.local

	# set up .my.cnf file for project
	mycnf_file=$HOME/.my.cnf.$2;
	cp $HOME/.base.my.cnf $mycnf_file;
	echo -e "\n[client]" >> $mycnf_file;
	for arg in "${@:3}";
	do
		echo "${arg/--/}" >> $mycnf_file;
	done
	exit 0;
fi

if [ $# -eq 1 ] && [ $1 != 'generate' ];
then
	tmux_file=$HOME/.tmuxinator/$1.yml;
	mycnf_file=$HOME/.my.cnf.$1;
	if [ -f $tmux_file ];
	then
		ln -sf $mycnf_file $HOME/.my.cnf;
		tmuxinator start $1;
		exit 0;
	else
		echo "could not find a tmuxinator project file at: $tmux_file";
		exit 255;
	fi
fi

/usr/bin/tmux
