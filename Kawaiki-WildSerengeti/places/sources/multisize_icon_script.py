#! /usr/bin/env python3

import sys
import os
import subprocess
import glob

# inkscape --export-area-page --export-width=WIDTH 
#     --export-height=HEIGHT --export-png=FILENAME

# USAGE:
#    mutli_icon_script -multi
#    or
#    multi_icon_script -single icon.svg
#
# FOLDER STRUCTURE
# /icon-theme
#   ./scalable
#   ./96
#   ./64
#   ./48
#   ./32
#   ./24
#   ./22
#   ./16

print('Inkscape has to be installed!')
conversion_mode = sys.argv[1]
print('Conversion-Mode: ' + conversion_mode)

if conversion_mode == '-single':
    svg_list = [sys.argv[2]]
        
elif conversion_mode == '-multi':
    svg_list = glob.glob('*.svg')

for input_svg in svg_list:
    print('Processing ' + input_svg)

    for size in [96, 64, 48, 32]:
        inkscape_command = ('inkscape '
                            + '--export-area-page '
                            + '--export-width=' + str(size) + ' '
                            + '--export-height=' + str(size) + ' '
                            + '--export-png='
                            + os.path.join('..', str(size),
                            input_svg[:-4] + '.png')
                            + ' ' + input_svg)
        print(inkscape_command)
        conversion = subprocess.Popen(inkscape_command, shell=True)
        conversion.wait()

    for size in [24, 22]:
        inkscape_command = ('inkscape '
                            + '--export-area=144:32:176:64 '
                            + '--export-width=' + str(size) + ' '
                            + '--export-height=' + str(size) + ' '
                            + '--export-png='
                            + os.path.join('..', str(size),
                            input_svg[:-4] + '.png')
                            + ' ' + input_svg)
        print(inkscape_command)
        conversion = subprocess.Popen(inkscape_command, shell=True)
        conversion.wait()

    for size in [16]:
        inkscape_command = ('inkscape '
                            + '--export-area=144:0:160:16 '
                            + '--export-width=' + str(size) + ' '
                            + '--export-height=' + str(size) + ' '
                            + '--export-png='
                            + os.path.join('..', str(size),
                            input_svg[:-4] + '.png')
                            + ' ' + input_svg)
        print(inkscape_command)
        conversion = subprocess.Popen(inkscape_command, shell=True)
        conversion.wait()





