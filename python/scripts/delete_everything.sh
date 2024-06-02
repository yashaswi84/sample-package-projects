#! /bin/sh

echo "Deleting Repos"
sh delete_repos.sh

echo "Deleting build"
sh delete_build.sh

echo "Deleting unwanted folders"
rm -rf build/
rm -rf dist/
rm -rf jfrog_python_example.egg-info/

echo "purge PIP cache"
pip cache purge

