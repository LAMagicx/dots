#!/usr/bin/env python

import yaml
import os
import re

COLORS_DIR = os.path.expanduser("~/.vim/colors/")
colors = []
for path, dirs, files in os.walk(COLORS_DIR):
	for f in files:
		if f[-4:] == ".vim":
			colors.append(f[:-4])


CONFIG_FILE_NAME = ".vimrc"
CONFIG_FILE_DIR = os.path.expanduser("~")
CONFIG_FILE_PATH = os.path.join(CONFIG_FILE_DIR, CONFIG_FILE_NAME)

COLOR_SCHEME_LINE_SEARCH = "colorscheme *(\S+)"
COLOR_SCHEME_LINE_TEMPLATE = "\tcolorscheme {}\n"


with open(CONFIG_FILE_PATH, 'r') as config_file:
	lines = config_file.readlines()


current_color_scheme = "not found"
colors_line_index = -1
for i, line in enumerate(lines):
	match = re.search(COLOR_SCHEME_LINE_SEARCH, line)
	if match is not None:
		current_color_scheme = match.group(1)
		colors_line_index = i

for i, c in enumerate(colors):
	if c == current_color_scheme:
		print(str(i) + " : " + c + " <")
	else:
		print(str(i) + " : " + c)

index = int(input("choose a colorscheme : "))%len(colors)

lines[colors_line_index] = COLOR_SCHEME_LINE_TEMPLATE.format(colors[index])

with open(CONFIG_FILE_PATH, 'w') as config_file:
	for line in lines:
		config_file.write(line)


