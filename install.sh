#/usr/bin/env
mkdir -p -v $HOME/.config/orig_conf_backup
mv -v $HOME/.bashrc $HOME/.config/orig_conf_backup/.bashrc
mkdir -p -v $HOME/.cache $HOME/.local $HOME/.config/zsh $HOME/.config/nano/syntax
mkdir -p -v $HOME/.local/share $HOME/.local/state $HOME/.local/data $HOME/.local/bin
cp -v .zshenv $HOME/
cp -v .zshrc $HOME/.config/zsh/
cp -v .nanorc $HOME/.config/nano/
cp -v syntax/* $HOME/.config/nano/syntax/
cat authorized_keys > $HOME/.ssh/authorized_keys
cat sshd_config /etc/ssh/sshd_config
