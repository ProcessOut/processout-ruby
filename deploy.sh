#! /bin/sh

echo " > Moving away generated library"
rm -rf ../.tmp
mkdir ../.tmp
mv {*,.[!.]*} ../.tmp/
echo " > Initializing git repository"
git init
git remote add origin git@github.com:processout/processout-ruby.git
echo " > Pulling from repository"
git fetch
git pull origin master
echo " > Removing everything from previous versions"
git rm -rf .
echo " > Adding back our new library"
mv ../.tmp/{*,.[!.]*} .
rm -rf ../tmp
echo " > Committing new library"
git add -A
git commit -m "$COMMITMESSAGE"
git tag -f "0.2.1"
echo " > Publishing the new version to github"
git push origin master --tags

echo " > Publishing to Rubygems"
gem build processout.gemspec
gem push processout-0.2.1.gem


echo " >> Done!"