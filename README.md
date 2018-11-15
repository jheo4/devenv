# Ubuntu Settings..

## VIM
```
mv vimrc ~/.vimrc
mv ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim           
  :PluginInstall

```
### Install YouCompleteMe
```
sudo apt install build-essential cmake python3-dev python-dev
cd ~/.vim/plugged/YouCompleteMe/
./install.sh --all
```

If there is a problem with fzf after these commands, 
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Sublime Text
./sublime.sh
ctrl + `

paste below 

~~~~~~~~~~~
import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by) 
~~~~~~~~~~~

### install packages 
Alignment<br>
AutoFileName<br>
BracketHighLighter<br>
DocBlockr<br>
FuzzyFileNav<br>
GitGutter<br>
MarkdownLivePreview<br>
TerminalView<br>
Anaconda<br>
ClangAutoComplete<br>
