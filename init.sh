#!/usr/bin/env bash
cd $(git rev-parse --show-toplevel)
rm -rf ./.git/hooks
mkdir -p ./.git/hooks
cp ./git-hook-pre-push.sh ./.git/hooks/pre-push
