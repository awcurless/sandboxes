#!/usr/bin/env sh
(exec bwrap \
    --ro-bind /usr/bin /usr/bin \
    --ro-bind /usr/lib64 /usr/lib64 \
    --ro-bind /bin /bin \
    --ro-bind /lib64 /lib64 \
    --ro-bind /etc/ld.so.conf.d /etc/ld.so.conf.d \
    --ro-bind /etc/ld.so.conf /etc/ld.so.conf \
    --ro-bind /etc/ld.so.cache /etc/ld.so.cache \
    --ro-bind /etc/ld.so.preload /etc/ld.so.preload \
    --tmpfs $HOME \
    --ro-bind $HOME/.Xauthority $HOME/.Xauthority \
    --ro-bind $HOME/documents $HOME/documents \
    --ro-bind $HOME/pictures $HOME/pictures \
    --ro-bind $HOME/dotfiles/backgrounds ${HOME}/dotfiles/backgrounds \
    --tmpfs /tmp \
    --ro-bind /tmp/.X11-unix/X0 /tmp/.X11-unix/X0 \
    --unshare-all \
    /usr/bin/feh "$@")
