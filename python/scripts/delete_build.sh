#! /bin/sh

#echo "\n\nCleaning npm-fixed-vulnerable build"
#cd ../npm-vulnerable-example
#rm -rf node_modules
#rm -rf .jfrog
#rm -f package-lock.json
#echo "\n--> npm-vuln-example build CLEANED"


#cd ../../../scripts

echo "START : Delete Builds : "
jf rt curl -XPOST /api/build/delete -H "Content-Type: application/json" -d @json/delete-python-build.json
echo "\n--> Complete : Delete Builds : "

