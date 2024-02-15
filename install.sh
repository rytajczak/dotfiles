#!/usr/bin/env bash

git pull
stow --adopt .
git restore .
