Install dropbox

```bash
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
```

mkdir -p ~/bin
wget -O ~/bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py"
chmod 755 ~/bin/dropbox.py

chmod 755 ~/Dropbox


./bin/dropbox.py start
~/bin/dropbox.py exclude add *
~/bin/dropbox.py exclude subtract Sites
