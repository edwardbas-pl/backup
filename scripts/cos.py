#!/bin/python3
import shutil
import sys
import os


def import_play_dir(playlist_file,path_list,target_dir):
    dir_name=os.path.splitext(playlist_file)[0] #get rid of playlist file extension
    dir_name=dir_name.replace(" ","_")
    dir_to_create = target_dir+"/"+dir_name
    print("dir to create: " + dir_to_create)
    os.system("mkdir -p " + dir_to_create)
    for i in path_list:
        #print("moving:" + i)
        shutil.copy2( i , dir_to_create+"/")
       # print(i)
        
 
def find_songs(list,cwd):
    ls = os.listdir(cwd)
    found_list = []
    for i in ls:
        if os.path.isdir(i) == True:
            if i in list:
                print("Ooops... That is unexpected...")
            else:
                found_list.append( find_songs(list,cwd+"/"+i))
        if os.path.isdir(i) == False:
            if i in list:
                found_list.append(cwd+"/"+i)
    return found_list



def get_playlists(dir):
    ls = os.listdir(dir)
    list = []
    for i in ls:
        extension = os.path.splitext(i)[1]
        if extension == ".m3u":
            print(i +" "+ "is a playlist")
            list.append(i)
    return list

def get_path_list(file):
        lista = []
        with open(file) as love:
            test_list = love.readlines()
        for i in test_list:
            lista.append(i.replace("\n",""))
        #print(lista)
        path_list = find_songs(lista,cwd)
        clean_path_list = []
        for i in lista:
            for j in path_list:
                if i in j:
                    clean_path_list.append(j)
        return clean_path_list

def main(arg):
    #print(len(arg))
    global cwd
    cwd = os.getcwd()
    if len(arg) > 1:
        path=arg[1]
        raw_playlists = get_playlists(cwd)
        print(raw_playlists)
        for i in raw_playlists:
            print(get_path_list(i))
            import_play_dir(i,get_path_list(i),path)
#        for i in raw_playlists:
#            playlists.append(i.replace(" ", "_"))

        #print(playlists)
        #for i in raw_playlists:
         #   print(i)

    else:
        print("number of parameters is invalid")

if __name__ == "__main__":
    main(sys.argv)


