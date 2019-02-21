# VIM Setting with YCM

install YCM [official](https://github.com/Valloric/YouCompleteMe)
```
cp vimrc ~/.vimrc
cp ycm_extra_config.py ~/.vim/.ycm_extra_config.py
```

## Setting for JAVA
Eclim + YCM => for Java!

- Install jdk(the jdk version should be matched with Eclim and other frameworks such as Hadoop)
- Install Eclipse for Java EE and Eclim [official](http://eclim.org/install.html)
- Install vim-eclim plugin
- Copy installed eclim files into ~/.vim/bundle/vim-eclim
- Set each .classpath and .project for each project

### Include extra jar
refer eclim [classpath editing](http://eclim.org/vim/java/classpath.html)
