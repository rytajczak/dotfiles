#!/bin/bash

layout=$(niri msg keyboard-layouts | grep '\*' | sed -E 's/.*\(([^)]*)\).*/\1/')

echo "$layout"
