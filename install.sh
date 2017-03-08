#FILES=$(find . -maxdepth 1 -mindepth 1 -name '.*')
for f in ".clang-format .emacs.d .i3 .i3blocks.conf prompt.sh .tmux .tmux.conf tmuxline.conf .toprc .vim .vimrc .xinitrc .xprofile .Xresources .ycm_extra_conf.py .zshrc .config/nvim"
do
ln -s $(readlink -f $f) ~/$f
done
