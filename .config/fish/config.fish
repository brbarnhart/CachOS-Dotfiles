source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
     #"hello"
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set -gx EDITOR "zed --wait"
set -gx VISUAL "zed --wait"

# uv
fish_add_path "/home/ben/.local/bin"

# >>> grok installer >>>
fish_add_path $HOME/.grok/bin
# <<< grok installer <<<
