# dotfiles
These are my configs.

I use [NEOVIM](https://github.com/neovim/neovim/wiki/Installing-Neovim) and therefore [Vundle](https://github.com/vundlevim/vundle.vim)

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

cloning dotfiles into new existing working dir

```
git init .
git remote add -t \* -f origin git@github.com:tracer99/dotfiles.git
git checkout master
```

I use [StarShip](https://starship.rs/) which needs a [Nerd Font](https://www.nerdfonts.com/font-downloads) and then you need to install it:

```
curl -sS https://starship.rs/install.sh | sh
```

Since I do a lot of JavaScript/NodeJS development, I use, and [this requires special configuration](https://eshlox.net/2019/01/27/how-to-use-nvm-with-fish-shell). 
