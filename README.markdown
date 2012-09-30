# Kamvim 

This is my vim setup. Have fun with it. 

## Plugins
	* NERDtree
	* NERDcomment
	* surround
	* tagbar
	* tabular
	* Fugitive
	* Command-T

## Install
    git clone git://github.com/Kamii/kamvim.git .vim
Then move .vimrc to home/<user>, or you can write

    ln ~/.vim/.vimrc .vimrc

Update the plugins with command

    git submodule init
    git submodule update

To install Command-T you need to run this:

    cd ~/.vim/bundle/command-t/ruby
    ruby extconf.rb
    make








