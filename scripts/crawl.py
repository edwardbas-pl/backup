#!/bin/python
import os

def detect_fie_type(name):
    if name.lower().endswith(( '.txt')):
        return 'TXT'
    if name.lower().endswith(( '.yt')):
        return 'YT' 

def crawl():
    ls=os.listdir(os.getcwd())
    ls.sort()
    for i in sorted(ls):
        if os.path.isdir(i) == True:
            os.chdir(i)
            crawl()
            os.chdir('../')
        else:
            type=detect_fie_type(i)
            if type == 'TXT':
                os.system('youtube-dl -a ' + i)
            elif type == 'YT':
                os.system('sh ' + i)

crawl()
