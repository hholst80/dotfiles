for __editor in nvim vim vi ed
do
	if which $__editor >& /dev/null
	then
		export EDITOR=$__editor
		break
	fi
done

for __path in /efs/bin $HOME/bin
do
	if [ -d $__path ] ## TODO: check if already in PATH
	then
		export PATH="$__path:$PATH"
	fi
done
# added by Miniconda3 4.2.12 installer
export PATH="/home/holst/miniconda3/bin:$PATH"
