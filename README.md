# dotfiles
These are my configs.

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

My shell prompt is Fish, Fisher with Starship

Choose and install a [NerdFont](https://www.nerdfonts.com/font-downloads)

Follow the [fish installation documentation for your OS](https://fishshell.com/), [Fisher](https://github.com/jorgebucaran/fisher) and then install [StarShip](https://starship.rs/)

Since I do a lot of JavaScript/NodeJS development, I use, and [this requires special configuration](https://eshlox.net/2019/01/27/how-to-use-nvm-with-fish-shell). 
