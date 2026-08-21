@echo off

rem The file seems smaller, it's only 200 megs. It looks like the latest FModel is able to export the texture.
rem extracted T_DLCWorldMap_UDIM and yea new maps are shitty. it's not 64k now it's only 16k.
rem CNPP is slighly revealed but it's all low res. Will add to extras.
rem The T_WorldMap_UDIM wasn't updated besides it was shrunk to 16k as well.

set infile=C:\Temp\Exports\Stalker2\Plugins\GameFeatures\S2_DLC1\Content\UI\WorldMap\T_DLCWorldMap_UDIM.png
set dstdir=..\extras\dlc

if exist fixed.v goto tiles

echo extracting the top band (2048px that should be at the bottom)
vips extract_area %infile% top_band.png 0 0 16384 2048 --vips-progress

echo extracting the rest of the image
vips extract_area %infile% rest.png 0 2048 16384 14336 --vips-progress

echo joining the halves
vips join rest.png top_band.png fixed.v vertical --vips-progress
del top_band.png rest.png


:tiles

vips dzsave fixed.v %dstdir% --layout google --tile-size 512 --suffix .webp[Q=85] --centre --vips-progress
