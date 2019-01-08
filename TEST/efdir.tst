                import efdir.mktree as emk
                
                
                # if the name end with a "$", it means this is a file, such as "xx$",  will touch a empty file named xx
                # else, it means this is a dir ,will make a dir
                
                rst_cfg = """
                - a
                
                    - b   
                
                            - xx$
                            - yy
                            - zz
                    - c
                    - d
                - e
                - f
                """
                
                
                emk.mktree(rst_cfg,"./wkdir")

                TEST# tree wkdir
                wkdir
                ├── a
                │   ├── b
                │   │   ├── xx
                │   │   ├── yy
                │   │   └── zz
                │   ├── c
                │   └── d
                ├── e
                └── f
                
                8 directories, 1 file

emk.fmktree("./cfg.rst","./wkdir")


######################

                import efdir.mktree as emk
                # if the name end with a "$", it means this is a file, such as "init.sh$",  will touch a empty file named init.sh
                # else, it means this is a dir ,will make a dir
                
                json_cfg = {
                    "REPO":{
                        "BACKUP" : {},
                        "DRAFT" : {},
                        "INIT" : {
                            "init.sh$":{}
                        },
                        "EDICT" : {
                            "IMGS":{
                                "img0.desc$":{},
                                "img1.desc$":{}
                            },
                            "DETAILS":{
                                "1.info$":{},
                                "2.info$":{}
                            },
                            "edict.py$":{}
                        },
                        "setup.py$":{},
                        "README.md$":{},
                        "LICENSE$":{},
                        "install.sh$":{},
                        "uninstall.sh$":{},
                        "update.sh$":{},
                        "pypiupload.sh$":{}
                    }
                }
                
                emk.mktree(json_cfg,"./wkdir")

TEST# tree wkdir/
wkdir/
└── REPO
    ├── BACKUP
    ├── DRAFT
    ├── EDICT
    │   ├── DETAILS
    │   │   ├── 1.info
    │   │   └── 2.info
    │   ├── edict.py
    │   └── IMGS
    │       ├── img0.desc
    │       └── img1.desc
    ├── INIT
    │   └── init.sh
    ├── install.sh
    ├── LICENSE
    ├── pypiupload.sh
    ├── README.md
    ├── setup.py
    ├── uninstall.sh
    └── update.sh

7 directories, 13 files
TEST#


emk.fmktree("./cfg.json","./wkdir")
