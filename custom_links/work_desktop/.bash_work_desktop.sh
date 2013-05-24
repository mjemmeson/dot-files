# work_desktop.sh

alias sshmj="ssh mjemmeson@ec2-54-242-208-227.compute-1.amazonaws.com"

#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

if [ -f $HOME/perl5/perlbrew/etc/bashrc ]; then
  source $HOME/perl5/perlbrew/etc/bashrc;
fi

source ~/.bash/prompt.sh

