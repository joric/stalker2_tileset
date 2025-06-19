# resize and glue 4x4 chunks of a 64k image into a single 32k image

from PIL import Image
import sys

Image.MAX_IMAGE_PIXELS = 2*933120000

nw = 4
nh = 4

sw = sh = 65536
tw = th = sw//nw

ow = oh = 32768
cw = ch = ow//nw

out = Image.new('RGB', (ow,oh))

for i in range(nw):
    for j in range(nh):
        fname = f'chunks/{j}/{i}.jpg'
        sys.stderr.write(f'pasting {fname}  \r')
        im = Image.open(fname)
        im = im.resize((cw, ch))
        out.paste(im, (i*cw, j*ch))

out.save(f'32k.jpg')

