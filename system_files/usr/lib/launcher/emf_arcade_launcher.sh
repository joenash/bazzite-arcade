#!/bin/sh
printf '\033c\033]0;%s\a' emf_arcade_launcher
base_path="$(dirname "$(realpath "$0")")"
"$base_path/emf_arcade_launcher.x86_64" "$@"
