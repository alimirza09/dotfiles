alias rm="rmtrash"
alias ls="exa --icons=always"
alias ll="exa --icons=always -lAh"
alias la="exa --icons=always -la"
alias install="sudo xbps-install -S"
alias remove="sudo xbps-remove -R"
alias gc="sudo git add . && sudo git commit -am "
set -gx EDITOR nvim
starship init fish | source

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
