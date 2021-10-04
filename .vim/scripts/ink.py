#!/usr/bin/python3
import subprocess
import sys 

if __name__ == "__main__":
    classname = sys.argv[1] + "/figures"
    filename = sys.argv[2]

    #subprocess.run("inkscape-figures create {0} {1}".format(filename, classname))
    subprocess.run(["/home/magic/.vim/scripts/ink.sh", filename, classname], capture_output=True)

    output = "![{0}](figures/{0}.pdf)".format(filename)

    print(output)
