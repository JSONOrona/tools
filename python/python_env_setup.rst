Managing Multiple Python Environments
=====================================

Setup:
-----
sudo pip install virtualenv
sudo pip install virtualwrapper

# Install Python from source into your home directory.

mkdir src
cd src
wget python-source-url
tar -xvf python-source-tar
cd python-source-folder
./configure --prefix=/my/home/directory/python/folder
make
make install

# Create your virt
mkvirtualenv -p /my/home/directory/python/folder my-cool-env
(my-cool-env)$ pip install -r my-package-requirement-file.txt
blah blah
blah blah
more verbose output
blah blah

# Check if it works
which python
python
which pip

# get out
deactivate

# go back
workon my-cool-env

# create a new virt while still in your virt
mkvirtualenv another-cool-env
(another-cool-env)$
# get out
deactivate
