#!/bin/sh

set -e

mkdir -p /tmp/pr3436/sub_origin
cd /tmp/pr3436/sub_origin
git init /tmp/pr3436/sub_origin
mkdir subdir
seq 1 10 >subdir/f
git add subdir/f
git commit -m 'subdir/f' -q

mkdir -p /tmp/pr3436/super_main
cd /tmp/pr3436/super_main
git init /tmp/pr3436/super_main
git submodule add /tmp/pr3436/sub_origin sub

cd sub
git worktree add -B master2 /tmp/pr3436/sub_worktree master
