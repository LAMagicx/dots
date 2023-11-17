#!/usr/bin/env python

import yaml
import os
import re


CONFIG_FILE_NAME = "colors.yml"
CONFIG_FILE_DIR = os.path.expanduser("~/.config/alacritty/")
CONFIG_FILE_PATH = os.path.join(CONFIG_FILE_DIR, CONFIG_FILE_NAME)

COLOR_SCHEME_LINE_SEARCH = "colors: \*(\S+)"
COLOR_SCHEME_LINE_TEMPLATE = "colors: *{}\n"

with open(CONFIG_FILE_PATH, "r") as config_file:
    config = yaml.safe_load(config_file)
    config_file.seek(0)
    lines = config_file.readlines()

colors_line_index = -1
for i, line in enumerate(lines):
    match = re.search(COLOR_SCHEME_LINE_SEARCH, line)
    if match is not None:
        current_color_scheme = match.group(1)
        colors_line_index = i

available_color_schemes = list(config["schemes"].keys())

for i, c in enumerate(available_color_schemes):
	if current_color_scheme == c:
		print(str(i) + " : " + c + " <")
	else:
		print(str(i) + " : " + c)

color_scheme_index = int(input("choose color scheme : "))%len(available_color_schemes)

lines[colors_line_index] = COLOR_SCHEME_LINE_TEMPLATE.format(
    available_color_schemes[color_scheme_index])

with open(CONFIG_FILE_PATH, "w") as config_file:
    for line in lines:
        config_file.write(line)