#!/bin/sh
(exec bwrap \
    --bind / / \
    --dev /dev \
    --proc /proc \
    --unshare-ipc \
    --unshare-cgroup \
    --unshare-uts \
    --hostname dhcpcd \
    /sbin/dhcpcd "$@")
