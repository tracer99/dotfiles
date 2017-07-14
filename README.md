# dotfiles
These are my configs.

I use fish as my main terminal.

```
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
```

I use Oh My Fish to make it pretty.

```
curl -L https://get.oh-my.fish | fish
```

I use VIM and therefore Vundle

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

cloning dotfiles into new existing working dir

```
git init .
git remote add -t \* -f origin git@github.com:tracer99/dotfiles.git
git checkout master
```

OMF needs a much newer version of GIT that comes with Ubuntu

```
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git 
```
