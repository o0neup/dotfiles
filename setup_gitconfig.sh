GITCONFIG_NAME=".gitconfig"

CONF=$(cat <<-_EOF_
[alias]
  co = checkout
  ci = commit
  st = status
  br = branch
  hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
  type = cat-file -t
  dump = cat-file -p
  brhist = for-each-ref --format='%(committerdate:short),%(authorname),%(refname:short)' --sort=committerdate refs/heads/
  plog = log --pretty=oneline
  glog = log --graph --pretty=format:'%Cred%h%Creset-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
  stash-all = stash save --include-untracked
  undo = reset --soft HEAD^
  showtool = "!f() { git difftool $1^ $1; }; f"
  added = difftool --cached

[status]
  showUntrackedFiles = all
  # Sometimes a newly-added folder, since it's only one line in git status, can slip under the radar.
  # https://git-scm.com/docs/git-config#git-config-statusshowUntrackedFiles
  # A nice little github-like colorful, split diff right in the console.
  # via http://owen.cymru/github-style-diff-in-terminal-with-icdiff/

[diff]
  tool = icdiff
[difftool]
  prompt = false
[difftool "icdiff"]
  cmd = /usr/local/bin/icdiff --line-numbers $LOCAL $REMOTE
[pager]
  difftool = true

_EOF_)

echo "${CONF}" >> "${HOME}/${GITCONFIG_NAME}"
