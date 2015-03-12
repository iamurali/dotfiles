
# MY BASH ALIASES
#
#Current Project Path here :
export CURRENT_PROJECT_PATH='/home/murali/Workspace/microsite'

export EDITOR='vi'
alias vi='vim'
alias vpn="sudo openvpn --cd ~/Tools/VPN --config client.conf --askpass passkey"
alias sq='mysql -u root -proot'
alias gitlog='git log --name-status'
alias gitlogtree="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias etrail='find . \( -name "*.rb" -o -name "*.html" -o -name "*.js" -o -name "*.coffee" -o -name "*.css" -o -name "*.scss" -o -name "*.erb" -o -name "*.yml" -o -name "*.ru" \) -exec sed -i "s/\s*$//" {} \; '
alias etrailrb='find . -name "*.rb" -exec sed -i "s/\s*$//" {} \; '
alias eblank='find . \( -name "*.rb" -o -name "*.html" -o -name "*.js" -o -name "*.coffee" -o -name "*.css" -o -name "*.scss" -o -name "*.erb" -o -name "*.yml" -o -name "*.ru" \) -exec sed -i "s/^\s+$/\n/g" {} \; '
alias sig_freud='rails_best_practices -f html .'
alias main="cd $CURRENT_PROJECT_PATH && clear && pwd"
alias clog="tail -100f $CURRENT_PROJECT_PATH/log/development.log"
alias trlog="> $CURRENT_PROJECT_PATH/log/development.log"
alias raket="rake -P | grep rake"
alias tarup="tar cfz"
alias untar="tar xvfz"
alias tarlist="tar -tzf"
alias queueinit="rake resque:work QUEUE='*'"
#alias hostdir='python -m SimpleHTTPServer'
alias hostdir='ruby -run -e httpd . -p 5000'
alias todo="grep -r 'OPTIMIZE\|FIXME\|TODO' *"
alias clipboard='xclip -sel clip'
function efind()
{
	find . -name "$1" | xargs grep -il $2
}

#Project Path Aliases
alias wspace='cd /home/murali/Workspace && clear && pwd'
alias personal='cd /home/murali/Personal && clear && pwd'
alias ref='cd /home/murali/Reference && clear && pwd'
alias blog='cd /home/murali/Personal/blog && clear && pwd'
alias testing='cd /home/murali/Testing && clear && pwd'

#SSH
alias work='ssh murali@10.0.6.45'
alias visual_cloud_app_server='ssh -i ~/Downloads/ec2-access.pem bitnami@54.235.123.38'

# show branch and dirty status, http://henrik.nyh.se/2008/12/git-dirty-prompt, http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) =~ "nothing to commit" ]] || echo "*"
}
function parse_git_branch {
  local branch=$(__git_ps1 "%s")
  [[ $branch ]] && echo "[$branch$(parse_git_dirty)]"
}
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
