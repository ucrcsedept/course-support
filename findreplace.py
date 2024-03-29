# This script will parse all .MD files in the repository, and replace the markdown-style hyperlinks with HTML-style hyperlinks.

import re
import glob

mdFiles = []
currentDepth = "./*.md"
# matchingString = "\[(.*?)\]\((.*?)\)"
# matchingString = "\[(.*?)\]\((http.*?)\)"
matchingString = "\[(.*?)\]\((http.*?)\)"
replaceString = '<a target="_blank" rel="noopener noreferrer" href="\\2">\\1</a>'

# MAX DEPTH: 4
for i in range(4):
    for file in glob.glob(currentDepth):
        mdFiles.append(file)
        # print(file)
    currentDepth = currentDepth[:2] + "*/" + currentDepth[2:]
    # print(currentDepth)

# for file in mdFiles:
#     f = open(file, "r")
#     fileContents = f.read()
#     listOfMatches = re.findall(matchingString, fileContents)
#     f.close()
#     print(listOfMatches)


for file in mdFiles:
        f = open(file, "r")
        fileContents = f.read()
        listOfMatches = re.findall(matchingString, fileContents)
        fileContentsNew = re.sub(matchingString, replaceString, fileContents)
        f.close()
        f = open(file, "w")
        f.write(fileContentsNew)
        print(listOfMatches)
        f.close()

# print(mdFiles) 