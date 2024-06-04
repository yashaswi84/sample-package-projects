#! /bin/sh

echo "Random Build number"
RANDOM=$$
export BUILD_NUMBER=${RANDOM}

cd ..

echo "Install project dependencies with pip from Artifactory:"
jf pip install . --build-name=pythonproject-build --build-number=$BUILD_NUMBER --module=jfrog-python-example --no-cache-dir --force-reinstal

echo "Package the project, create distribution archives (tar.gz and whl)"
python setup.py sdist bdist_wheel

echo "Upload the packages to the PackageKnowledge-python-virtual repository in Artifactory"
jf rt u dist/  $VIRTUAL_REPO/ --build-name=pythonproject-build --build-number=$BUILD_NUMBER --module=jfrog-python-example

echo "Collect environment variables and add them to the build info"
jf rt bce pythonproject-build $BUILD_NUMBER

#Collect GIT Variables
echo "Collect GIT Variables"
jf rt bag pythonproject-build $BUILD_NUMBER

echo "Publish the build info to Artifactory"
jf rt bp --build-url JFrog-CLI pythonproject-build $BUILD_NUMBER

echo "START : Xray Scan"
jf bs pythonproject-build $BUILD_NUMBER
echo "COMPLETE : Xray Scan"
