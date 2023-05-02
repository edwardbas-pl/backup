#!/bin/python3
import os
from natsort import natsorted # pip install natsort
import ntpath


#def crawl( ls , file_list ):
#    for i in ls:
#        if os.path.isdir(i):
#            pass
#            os.chdir(i)
#            output = crawl( os.listdir(i) , file_list )
#            os.chdir('../')
#            for j in output:
#                file_list.append(j)
#        else:
#            print(i)
#            pass
#    pass

def path_remodel(path) -> str:
	string = ''
	path = path.replace('//' , '/')
	txt = path.split("/")
	txt =  txt[1:]
	for i in txt:
	    string = string + '/'
	    string = string +  '"' + i + '"' 
	    #string = string + '/'
	return string

def transcode( file_list ,  rootdir , outdir = '/out' ) -> int:
    if outdir == '/out':
        outdir = rootdir+outdir
    os.system( ' mkdir -p ' + outdir )
    for i in file_list:
        file_name = get_file_name( i )
        file_without_extension = extension_split( file_name )
        without_root = remove_root_dir( i , rootdir )
        path_to_replicate = without_root.replace( file_name , '' )
        #path_to_replicate = path_to_replicate.replace('/','')
        path_to_replicate = path_remodel( outdir + path_to_replicate )
        #print(outdir+path_to_replicate)
        os.system( ' mkdir -p ' + path_to_replicate )
        outfile = path_to_replicate + file_without_extension + '.m4a"'
        outfile = outfile.replace('""','"')
        command = "ffmpeg -n -i " + path_remodel(i) + "  -c:v copy -c:a alac -ar 44100  -sample_fmt s16p " + outfile
        #print(outfile)
        os.system(command)
        pass
    return 0

def get_file_name( path ) -> str:
    return ntpath.basename( path )

def remove_root_dir( path , rootdir ) -> str:
    return path.replace( rootdir , '' )

def extension_split(file) -> str:
    return os.path.splitext(file)[0]

def path_remodel(path) -> str:
	string = ''
	txt = path.split("/")
	txt =  txt[1:]
	for i in txt:
	    string = string + '/'
	    string = string +  '"' + i + '"' 
	    #string = string + '/'
	return string

def crawl(extensions) -> list:
    pwd = os.getcwd()
    ls=os.listdir(pwd)
    ls = natsorted(ls)
    list_to_transcode = []
    lrc_file_list = []
    for i in ls:
        if os.path.isdir(i) == True:
            if 'out' == i:
                pass
            else:
                os.chdir(i)
                #print(i + 'is a directory being recursive...')
                output_files,output_lrc_files = crawl(extensions)
                os.chdir('../')
                for j in output_files:
                    list_to_transcode.append(j)
                for k in output_lrc_files:
                    lrc_file_list.append(k)
        else:
            extension = os.path.splitext(i)[1]
            if extension in extensions:
                #print(i + "is a supported video")
	            list_to_transcode.append( os.getcwd() + '/' + i )
            elif extension == '.lrc':
                lrc_file_list.append( os.getcwd() + '/' + i )
    return list_to_transcode , lrc_file_list

def main():
    audio_file_extensions = ['.flac','.m4a','.mp3','.waw']
    files = []
    ROOTDIR = os.getcwd()
    LS = os.listdir(ROOTDIR)
#    print(ROOTDIR)
#    print(LS)
    list_to_transcode,lrc_list = crawl(audio_file_extensions)
    transcode(list_to_transcode , ROOTDIR)
    pass

if __name__ == "__main__":
    main()
