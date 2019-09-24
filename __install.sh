#!/bin/bash

# a new program for graphic design
# install quicktime player controls as services
# with applecript cmd and tmp

TARGET=~/Library/Services

# install services
cp -r *.workflow $TARGET

# install applescript
cp *.scpt $TARGET

# install tmp
cp *.txt $TARGET

echo "done."

exit
