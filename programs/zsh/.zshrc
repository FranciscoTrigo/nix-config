# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

alias wifisetup='nmtui'
alias tree="tree -C"
alias calculator="bc"


# starship prompt
eval "$(starship init zsh)"

PATH="/home/yamifrankc/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/yamifrankc/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/yamifrankc/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/yamifrankc/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/yamifrankc/perl5"; export PERL_MM_OPT;
