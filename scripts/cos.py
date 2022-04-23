#!/bin/python3

import os
pwd = os.getcwd

ls = os.listdir()
ls.sort()

for i in ls:
    if os.path.isdir(i) == True:
        call = "zip -rm9fz '" + str(i) + ".cbz' '" + str(i) + "/'"
        print(call)
        os.system(call)
