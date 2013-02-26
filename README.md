rmitc-vim
=========

Demonstration of the "finished product" of RMIT IT Club's vim introductory tutorial

# 1. Compile git
https://github.com/git/git/archive/master.zip

```bash
unzip git-master.zip
mkdir mygit
cd git-master
make prefix=~/mygit all
make prefix=~/mygit install
```

# 2. Compile vim
ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2

```bash
mkrdir myvim
tar xvjf vim-7.3.tar.bz2
cd vim73
make distclean
./configure --with-features=huge --enable-gui=gnome2 --enable-pythoninterp --prefix=/home/sNumberHere/myvim
make
make install
```
