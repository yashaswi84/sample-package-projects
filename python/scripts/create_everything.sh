echo "Creating Necessary repos "
sh create_local_repos.sh
sh create_remote_repos.sh
sh create_virtual_repos.sh

sh index_build.sh

echo "Random build number"
RANDOM=$$
export BUILD_NUMBER=${RANDOM}
#export BUILD_NAME='pythonproject-build'
export VIRTUAL_REPO='PackageKnowledge-python-virtual'

echo "Creating Python build "
sh create-python-build.sh

