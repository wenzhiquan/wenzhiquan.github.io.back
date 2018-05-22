#!/bin/bash

hexo clean
hexo generate
gulp
hexo deploy
