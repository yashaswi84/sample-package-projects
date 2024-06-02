#! /bin/sh

cd ..

echo "Install project dependencies with pip from Artifactory:"
jf pip install . --build-name=pythonproject-build --build-number=$BUILD_NUMBER --module=jfrog-python-example --no-cache-dir --force-reinstal

echo "Package the project, create distribution archives (tar.gz and whl)"
python setup.py sdist bdist_wheel

echo "Upload the packages to the PackageKnowledge-python-virtual repository in Artifactory"
jf rt u dist/  $VIRTUAL_REPO/ --build-name=pythonproject-build --build-number=$BUILD_NUMBER --module=jfrog-python-example

echo "Collect environment variables and add them to the build info"
jf rt bce pythonproject-build $BUILD_NUMBER

echo "Publish the build info to Artifactory"
jf rt bp pythonproject-build $BUILD_NUMBER
