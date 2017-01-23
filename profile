for __editor in nvim vim vi nano
do
	if which $__editor >& /dev/null
	then
		export EDITOR=$__editor
		break
	fi
done

for __path in /efs/bin $HOME/.local/bin $HOME/bin $HOME/miniconda3/bin
do
	if test -d $__path # TODO: check if already in PATH
	then
		export PATH="$__path:$PATH"
	fi
done

if ! test -z $BASH_VERSION
then
	source .bashrc
fi
