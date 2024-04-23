echo "THIS IS .ZLOGIN"

# SSH
# =============================================================================

eval "$(ssh-agent -s)" > /dev/null


# Load SSH keys and setup ASKPASSes:
# =============================================================================

# go home (WSL usually starts in a weird directory:
cd ~

# bitwarden cli:
if command -v rbw > /dev/null; then
    echo "HAVE rbw"
    rbw unlock  # will ask for password if not yet logged in
    {
        setopt extended_glob
        for key in ~/.ssh/id^*.*; do
            DISPLAY=1 SSH_ASKPASS="${HOME}/.config/zsh/askpass_ssh" ssh-add -q "$key" < /dev/null
        done
        unsetopt extended_glob
    } &|
    # sudo -A will use bitwarden to look up password based on username
    # sudo asks for and host the command is executed on:
    export SUDO_ASKPASS="${HOME}/.config/zsh/askpass_sudo"
fi
