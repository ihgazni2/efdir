import os
import json
import shutil
import elist.elist as elel


def pl2path(pl):
    pl = elel.mapv(pl,str)
    return(os.path.join(*pl))

def path2pl(path):
    pl = []
    parent,ele = os.path.split(path)
    pl = elel.unshift(pl,ele)
    while(parent != ""):
        parent,ele = os.path.split(parent)
        pl = elel.unshift(pl,ele)
    return(pl)

def rbfile(fn):
    fd = open(fn,'rb+')
    rslt = fd.read()
    fd.close()
    return(rslt)

def rfile(fn,codec='utf-8'):
    rslt = rbfile(fn)
    rslt = rslt.decode(codec)
    return(rslt)

def wbfile(fn,content):
    fd = open(fn,'wb+')
    fd.write(content)
    fd.close()

def wfile(fn,content,codec='utf-8'):
    content = content.encode(codec)
    wbfile(fn,content)

def abfile(fn,content):
    fd = open(fn,'ab+')
    fd.write(content)
    fd.close()

def afile(fn,content,codec='utf-8'):
    content = content.encode(codec)
    abfile(fn,content)

def prepend(fn1,fn2,codec='utf-8',**kwargs):
    if('fsp' in kwargs):
        fsp = kwargs['fsp']
    else:
        fsp = "\n"
    content1 = rfile(fn1,codec)
    content2 = rfile(fn2,codec)
    content = content2+fsp+content1
    wfile(fn1,content,codec)

def rjson(fn,codec='utf-8'):
    s = rfile(fn,codec)
    d = json.loads(s)
    return(d)

def wjson(fn,js,codec='utf-8'):
    s = json.dumps(js)
    wfile(fn,s,codec)
    fd.close()

def touch(fn):
    fd = open(fn,"w+")
    fd.write("")
    fd.close()

def filexist(path):
    return(os.path.exists(path) & os.path.isfile(path))

def direxist(path):
    return(os.path.exists(path) & os.path.isdir(path))

def mkdir(path,**kwargs):
    if('force' in kwargs):
        force = kwargs['force']
    else:
        force = False
    try:
        os.mkdir(path)
    except Exception as e:
        if(force):
            if(e.errno == 17):
                try:
                    #print("Try rmdir "+path)
                    os.rmdir(path)
                except Exception as e:
                    if(e.errno == 41):
                        #print("rmtree descendants dirs of "+path)
                        shutil.rmtree(path)
                    else:
                        #print(e)
                        pass
                else:
                    pass
                os.mkdir(path)
            else:
                pass
        else:
            #print(e)
            pass
    else:
        pass

def mkdirs(path,**kwargs):
    if('force' in kwargs):
        force = kwargs['force']
    else:
        force = False
    try:
        os.makedirs(path)
    except Exception as e:
        if(force):
            if(e.errno == 17):
                try:
                    #print("Try removedirs "+path)
                    os.removedirs(path)
                except Exception as e:
                    if(e.errno == 41):
                        #print("rmtree descendants dirs of "+path)
                        shutil.rmtree(path)
                    else:
                        #print(e)
                        pass
                else:
                    pass
                os.makedirs(path)
            else:
                pass
        else:
            #print(e)
            pass
    else:
        pass
