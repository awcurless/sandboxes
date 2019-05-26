#!/usr/bin/env bash
set -euo pipefail
(exec bwrap --ro-bind /usr /usr \
      --dir /tmp \
      --dir /var \
      --symlink ../tmp var/tmp \
      --proc /proc \
      --dev /dev \
      --ro-bind /etc/resolv.conf /etc/resolv.conf \
      --ro-bind /bin /bin \
      --ro-bind /usr/bin /usr/bin \
      --ro-bind /usr/lib64 /usr/lib64 \
      --ro-bind /bin /bin \
      --ro-bind /lib64 /lib64 \
      --chdir / \
      --unshare-all \
      --die-with-parent \
      --dir /run/user/$(id -u) \
      --setenv XDG_RUNTIME_DIR "/run/user/`id -u`" \
      --setenv PS1 "bwrap-sandbox$ " \
      --file 11 /etc/passwd \
      --file 12 /etc/group \
      /bin/sh) \
    11< <(getent passwd $UID 65534) \
    12< <(getent group $(id -g) 65534)
