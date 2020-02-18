from efdir import fobj

# creat a dir
fo = fobj.F('tstdir')
fo
#>>> fo
#/opt/PY3/EFDIR/TEST/tstdir

# creat subdir
fo.subdir0
fo.subdir1
fo.sub#<TAB>

#>>> fo.subdir0
#/opt/PY3/EFDIR/TEST/tstdir/subdir0
#>>> fo.subdir1
#/opt/PY3/EFDIR/TEST/tstdir/subdir1
#>>>
#>>> fo.subdir
#fo.subdir0  fo.subdir1
#>>> fo.subdir

fo.subdir0.dir10
fo.subdir0.dir11
fo.subdir0.dir12
#>>> fo.subdir0.dir10
#/opt/PY3/EFDIR/TEST/tstdir/subdir0/dir10
#>>> fo.subdir0.dir11
#/opt/PY3/EFDIR/TEST/tstdir/subdir0/dir11
#>>> fo.subdir0.dir12
#/opt/PY3/EFDIR/TEST/tstdir/subdir0/dir12
#>>>

#check 
import os
os.system('tree tstdir')
#>>> import os
#>>> os.system('tree tstdir')
#tstdir
#├── subdir0
#│   ├── dir10
#│   ├── dir11
#│   └── dir12
#└── subdir1>>> import os
#

#rename

fo.subdir0 = "subdir00"
fo.subdir#<TAB>

#>>> fo.subdir0 = "subdir00"
#>>> fo.subdir
#fo.subdir00  fo.subdir1
#>>> fo.subdir

#rmdir
del fo.subdir1
os.system('tree tstdir')

#>>> del fo.subdir1
#/opt/PY3/EFDIR/TEST/tstdir/subdir1
#>>>
#>>> os.system('tree tstdir')
#tstdir
#└── subdir00
#    ├── dir10
#    ├── dir11
#    └── dir12



# parent
fo.subdir00.dir12.__parent
fo.subdir00.dir12.__parent.__parent
fo.subdir00.dir12.__parent.__parent.__parent
# >>> fo.subdir00.dir12.__parent
# /tstdir/subdir00
# >>> fo.subdir00.dir12.__parent.__parent
# /tstdir
# >>> fo.subdir00.dir12.__parent.__parent.__parent
# null
# >>>


