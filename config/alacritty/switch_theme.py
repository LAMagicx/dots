#!/usr/bin/python
import yaml, os, re

VIM_CONFIG_FILE_NAME = ".vimrc"
VIM_CONFIG_FILE_DIR = os.path.expanduser("~")
VIM_CONFIG_COLORS_DIR = os.path.expanduser("~/.vim/colors/")
VIM_CONFIG_FILE_PATH = os.path.join(VIM_CONFIG_FILE_DIR, VIM_CONFIG_FILE_NAME)

VIM_COLOR_SCHEME_LINE_SEARCH = "colorscheme *(\S+)"
VIM_COLOR_SCHEME_LINE_TEMPLATE = "\tcolorscheme {}\n"

ALA_CONFIG_FILE_NAME = "colors.yml"
ALA_CONFIG_FILE_DIR = os.path.expanduser("~/.config/alacritty/")
ALA_CONFIG_FILE_PATH = os.path.join(ALA_CONFIG_FILE_DIR, ALA_CONFIG_FILE_NAME)

ALA_COLOR_SCHEME_LINE_SEARCH = "colors: \*(\S+)"
ALA_COLOR_SCHEME_LINE_TEMPLATE = "colors: *{}\n"

def get_vim_colors():
	colors = []
	for path, dirs, files in os.walk(VIM_CONFIG_COLORS_DIR):
		for f in files:
			if f[-4:] == ".vim":
				colors.append(f[:-4])
	
	return colors


def get_ala_colors():
	with open(ALA_CONFIG_FILE_PATH, "r") as config_file:
		config = yaml.safe_load(config_file)

	return list(config["schemes"].keys())


def get_same_colors():
	vim_colors = set(get_vim_colors())
	ala_colors = set(get_ala_colors())

	return list(vim_colors.intersection(ala_colors))


def get_current_color_scheme():
	with open(VIM_CONFIG_FILE_PATH, "r") as f:
		lines = f.readlines()
	
	for i, line in enumerate(lines):
		match = re.search(VIM_COLOR_SCHEME_LINE_SEARCH, line)
		if match is not None:
			return match.group(1)

	return 'dash'

def switch_color_scheme():
	options = get_same_colors()

	set_color_scheme(options[(options.index(get_current_color_scheme())+1)%len(options)])


def set_color_scheme(scheme):
	set_vim_color_scheme(scheme)
	set_ala_color_scheme(scheme)
	print("color scheme {} has been set".format(scheme))


def set_vim_color_scheme(scheme):
	with open(VIM_CONFIG_FILE_PATH, "r") as f:
		lines = f.readlines()
	
	for i, line in enumerate(lines):
		match = re.search(VIM_COLOR_SCHEME_LINE_SEARCH, line)
		if match is not None:
			color_scheme_line_index = i
			break

	lines[color_scheme_line_index] = VIM_COLOR_SCHEME_LINE_TEMPLATE.format(scheme)

	with open(VIM_CONFIG_FILE_PATH, "w") as f:
		for line in lines:
			f.write(line)


def set_ala_color_scheme(scheme):
	with open(ALA_CONFIG_FILE_PATH, "r") as f:
		lines = f.readlines()
	
	for i, line in enumerate(lines):
		match = re.search(ALA_COLOR_SCHEME_LINE_SEARCH, line)
		if match is not None:
			color_scheme_line_index = i
			break

	lines[color_scheme_line_index] = ALA_COLOR_SCHEME_LINE_TEMPLATE.format(scheme)

	with open(ALA_CONFIG_FILE_PATH, "w") as f:
		for line in lines:
			f.write(line)

if __name__ == "__main__":
	switch_color_scheme()
