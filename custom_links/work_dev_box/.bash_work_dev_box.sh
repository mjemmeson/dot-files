# work_dev_box.sh

eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

alias mysql="mysql --pager='grep -v Sleep'"
export MYSQL_PS1="\u@\h:\d % "

# User specific aliases and functions
alias update_aliases='print_db_aliases > ~/.db_aliases 2>/dev/null; source ~/.db_aliases; print_ssh_aliases > ~/.ssh_aliases 2>/dev/null; source ~/.ssh_aliases'

update_aliases
. ~/.db_aliases
. ~/.ssh_aliases

export PATH="$EC2_HOME/bin:/opt/platform/bin/systems:$PATH"

alias grok='find . -type f \( -regex ".*\.\(html\|config\|pm\|\pl\)" -o -regex ".*/[^/.]*$" \) -a \( -not -regex ".*CVS.*" \)  -a \( -not -regex ".*~.*" \) -a \( -not -regex ".*/tmp/.*" \) -print0 | xargs -0 grep '

#
# Tab-completion of SVN paths.
#
# If you type svn ls svn:<tab> then it assumes svn://svr-svn.master:13333/
# and provides completion from there.
#

# This is magic to allow url completion (paths containing a : character)
COMP_WORDBREAKS=${COMP_WORDBREAKS//:}

# Dev project link is svn://svr-svn.master:13333
_svn()
{
    local cur head tail ls_results opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"

    case "$cur" in
    *://*/*)
        head="${cur%/*}"
        tail="${cur##*/}"
        ls_results=$(svn ls --non-interactive $head)
        COMPREPLY=($(compgen -P "$head/" -W "$ls_results" -- "$tail"))
        ;;
    svn:*)
        opts=(svn://svr-svn.master:13333/)
        COMPREPLY=($(compgen -W "${opts[*]}" -- "$cur"))
        ;;
    file:*)
        opts=(file:///opt/svn/repos/)
        COMPREPLY=($(compgen -W "${opts[*]}" -- "$cur"))
        ;;
    esac

}

complete -F _svn -o default -o nospace svn

