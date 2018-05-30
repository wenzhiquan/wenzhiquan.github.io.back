#!/bin/bash

bookmark="./themes/next/source/lib/bookmark"
reading_progress="./themes/next/source/lib/reading_progress"

if [ ! -d "$bookmark" ];
then
    git clone https://github.com/theme-next/theme-next-bookmark.git ./themes/next/source/lib/bookmark
fi

if [ ! -d "$reading_progress" ];
then
    git clone https://github.com/theme-next/theme-next-reading-progress ./themes/next/source/lib/reading_progress
fi

hexo clean
hexo generate
gulp
hexo deploy
