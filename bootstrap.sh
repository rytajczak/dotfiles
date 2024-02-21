#!/bin/bash

git pull
stow --adopt .
git restore .
