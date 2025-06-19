set path=D:\Shared\Tools\Hacking\Games\UE\ZenTools;%path%

set gamedir=E:\Games\S.T.A.L.K.E.R. 2.Heart.of.Chornobyl.Ultimate.Editon-InsaneRamZes
set indir=C:\Temp\Exports\Indir
set outdir=C:\Temp\Exports\Outdir
mkdir %indir%
mkdir %outdir%

copy "%gamedir%\Stalker2\Content\Paks\pakchunk16-Windows.*" "%indir%"

ZenTools.exe ExtractPackages "%indir%" "%outdir%" -AES=0x33A604DF49A07FFD4A4C919962161F5C35A134D37EFA98DB37A34F6450D7D386 -ZenPackageVersion=Initial

