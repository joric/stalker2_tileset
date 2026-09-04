@echo off

set infile=r6kvqc82w98e1.png
set dstdir=..\extras\dolg

vips dzsave %infile% %dstdir% --layout google --tile-size 512 --suffix .webp[Q=85] --centre --vips-progress
