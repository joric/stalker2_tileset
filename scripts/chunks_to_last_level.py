from PIL import Image
import os, sys
import time

Image.MAX_IMAGE_PIXELS = 2*933120000

w = h = 512

outdir = '../tiles/7'

tiles = 0
total = 128*128

# chunks are 32k x 8k we save 512px tiles, so it's 64x16 tiles per chunk
# total map would be 128x128 512px tiles

nw = 4
nh = 4

tw = 65536//nw//512
th = 65536//nh//512

def process_chunk(im, start_x, start_y, tw, th, imname):
    global tiles

    for dx in range(tw):
        for dy in range(th):
            x = start_x + dx
            y = start_y + dy
            fname = os.path.join(outdir, f'{x}', f'{y}.jpg')
            path = os.path.split(fname)[0]
            os.makedirs(path, exist_ok=True)

            # now how we crop? very simple (left, up, right, low)

            img = im.crop((dx*w, dy*h, dx*w+w, dy*h+h))
            image_bytes = img.tobytes()

            #print(image_bytes[:8].hex())

            img.save(fname, quality=70, subsampling=0, optimize=True) # should be about 760M overall

            #break

            sys.stderr.write(f'{imname}: saving ({x},{y}), {tiles} of {total}  \r')
            tiles += 1

for j in range(nh):
    for i in range(nw):
        fname = f'chunks/{j}/{i}.jpg';
        t = time.time()
        im = Image.open(fname)
        process_chunk(im, i * tw, j * th, tw, th, fname)
