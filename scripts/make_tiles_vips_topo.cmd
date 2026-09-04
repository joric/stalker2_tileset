@echo off

set infile="Topographic map Stalker 2.jpg"
set dstdir=..\extras\topo

rem resize to exactly 32k first
vips resize %infile% fixed.v 1.040386 --vscale 1.040386 --kernel cubic --vips-progress

vips dzsave fixed.v %dstdir% --layout google --tile-size 512 --suffix .webp[Q=85] --centre --vips-progress

