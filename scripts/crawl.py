#!/bin/python
import os

print('give me pattern')
pattern = input()

ls = os.listdir(os.getcwd)
for i in ls:
    print ( name, fnmatch.fnmatch(name, pattern))
