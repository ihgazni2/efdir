pip3 uninstall efdir
git rm -r dist
git rm -r build
git rm -r efdir.egg-info
rm -r dist
rm -r build
rm -r efdir.egg-info
git add .
git commit -m "remove old build"
