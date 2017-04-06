#!/usr/sbin/python
import zlib
import sys


def compress(infile, dst, level=9):
    infile = open(infile, 'rb')
    dst = open(dst, 'wb')
    compress = zlib.compressobj(level)
    data = infile.read(1024)
    while data:
        dst.write(compress.compress(data))
        data = infile.read(1024)
    dst.write(compress.flush())


input = sys.argv[1]
output = sys.argv[2]
compress(input, output)
