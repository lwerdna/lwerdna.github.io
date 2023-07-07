#!/bin/bash
#
# Get the input images (Artboard 1.png, Artboard 2.png, etc.)
# https://boardgamegeek.com/filepage/229019/robots-2-player-mode - thank you to MesteRobot!
#
# Install ImageMagick tools to your path.
# https://imagemagick.org/index.php
#
# Run!

convert Artboard\ 1.png -crop 1240x480+1240+540 phase1_a.png
convert Artboard\ 1.png -crop 1240x480+1240+1020 phase2_a.png
convert Artboard\ 1.png -crop 1240x480+1240+1500 phase3_a.png
convert Artboard\ 1.png -crop 1240x480+1240+1980 phase4_a.png
convert Artboard\ 1.png -crop 1240x480+1240+2460 special_a.png

convert Artboard\ 2.png -crop 1240x480+1240+540 phase1_b.png
convert Artboard\ 2.png -crop 1240x480+1240+1020 phase2_b.png
convert Artboard\ 2.png -crop 1240x480+1240+1500 phase3_b.png
convert Artboard\ 2.png -crop 1240x480+1240+1980 phase4_b.png
convert Artboard\ 2.png -crop 1240x480+1240+2460 special_b.png

convert Artboard\ 3.png -crop 1240x480+1240+540 phase1_c.png
convert Artboard\ 3.png -crop 1240x480+1240+1020 phase2_c.png
convert Artboard\ 3.png -crop 1240x480+1240+1500 phase3_c.png
convert Artboard\ 3.png -crop 1240x480+1240+1980 phase4_c.png
convert Artboard\ 3.png -crop 1240x480+1240+2460 special_c.png

convert Artboard\ 4.png -crop 1240x480+1240+540 phase1_d.png
convert Artboard\ 4.png -crop 1240x480+1240+1020 phase2_d.png
convert Artboard\ 4.png -crop 1240x480+1240+1500 phase3_d.png
convert Artboard\ 4.png -crop 1240x480+1240+1980 phase4_d.png
convert Artboard\ 4.png -crop 1240x480+1240+2460 special_d.png

convert Artboard\ 5.png -crop 1240x480+1240+540 phase1_e.png
convert Artboard\ 5.png -crop 1240x480+1240+1020 phase2_e.png
convert Artboard\ 5.png -crop 1240x480+1240+1500 phase3_e.png
convert Artboard\ 5.png -crop 1240x480+1240+1980 phase4_e.png
convert Artboard\ 5.png -crop 1240x480+1240+2460 special_e.png

convert Artboard\ 6.png -crop 1240x480+1240+540 phase1_f.png
convert Artboard\ 6.png -crop 1240x480+1240+1020 phase2_f.png
convert Artboard\ 6.png -crop 1240x480+1240+1500 phase3_f.png
convert Artboard\ 6.png -crop 1240x480+1240+1980 phase4_f.png
convert Artboard\ 6.png -crop 1240x480+1240+2460 special_f.png

mogrify -resize 30% phase*.png
mogrify -resize 30% special*.png
