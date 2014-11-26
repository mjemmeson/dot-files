# work_desktop.sh

#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

if [ -f $HOME/perl5/perlbrew/etc/bashrc ]; then
  source $HOME/perl5/perlbrew/etc/bashrc;
fi

source ~/.bash/prompt.sh

# dbdesc is final field in mysql.conf
_db ()
{
    local dbdesc=$1;
    shift 1;
    local details=$(awk '/,'$dbdesc'(,1)?$/ { split($0,a,","); print "-A --prompt=\\u@DB:" a[5] "> -h " a[1] " -u " a[3] " -p" a[4] " " a[2] }' ~/BB/config/mysql.conf);
    mysql $details
}

m ()
{
    local dbdesc=$1;
    case $dbdesc in
        -* | '')
            dbdesc=default
        ;;
        *)
            shift 1
        ;;
    esac;
    _db $dbdesc $@
}




alias cvp="perl -Mlocal::lib=/home/michaelj/dev/bb_cvparserapi/local /home/michaelj/dev/bb_cvparserapi/bin/app.pl"
alias ch="ssh -vp222 www@cheerleader2.gs.broadbean.net"
alias earthquake="ssh -vp222 www@192.168.1.7"

alias routes="sudo route add -net 10.1.1.0/24 dev eth5; sudo route add -net 10.1.1.0/24 gw 10.1.1.253"


export PERL_CPANM_OPT="--mirror http://192.168.1.26:2000 --mirror http://192.168.1.26:8080 --mirror-only --cascade-search"
#export PERL_CARTON_MIRROR="http://pintod.gs.broadbean.net:2000/init,http://pintod.gs.broadbean.net:8080"

alias atsp="perl -Mlocal::lib=/home/michaelj/dev/ats-local-lib"
alias atspr="prove -Mlocal::lib=/home/michaelj/dev/ats-local-lib -lvr"
alias atscpanm="cpanm -L /home/michaelj/dev/ats-local-lib"
alias ats-update="/home/michaelj/dev/p5-bean-ats/scripts/ats-update.sh"
alias atsm="atsp ../ats-local-lib/bin/morbo  bin/app.pl"


