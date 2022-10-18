import re
import os
import glob

mdfiles = []
currentDepth = "./*.md"
print(currentDepth)

# MAX DEPTH: 4
for i in range(4):
    for file in glob.glob(currentDepth):
        print(file)
    currentDepth = currentDepth[:2] + "*/" + currentDepth[2:]
    print(currentDepth)