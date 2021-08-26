#!/bin/python

import webbrowser

b = webbrowser.get('firefox')

list=[
        "",
        ]

for i in list:
    b.open(i)
