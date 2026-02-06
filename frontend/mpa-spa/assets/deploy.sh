#!/bin/sh

# init local variables
DEPLOY_FOLDER="dist"
GIT_COMMIT_MESSAGE="New build for deploy: "$(date)
GIT_BRANCH_LOCAL="deploy"
GIT_BRANCH_REMOTE="gh-pages"
#GIT_REPO_REMOTE="https://github.com/<Organisation>/<Project>.git"

# abort on errors
set -e
# remove the deploy folder
rm -rf $DEPLOY_FOLDER
# First run the build command as usual
npm run build
# navigate into the build output folder (default this is dist/)
cd $DEPLOY_FOLDER
# copy index.html to 404.html
# to fix 404 errors on navigating to a route directly
cp index.html 404.html
# create empty .nojekyll file to bypass Jekyll processing (a gitHub thing)
echo > .nojekyll

# initialize git IN THE DIST FOLDER (we navigated here above)
git init
# if not exists create a new local branch called 'deploy' 
# otherwise reset the branch
git checkout -B $GIT_BRANCH_LOCAL
# add all files to the git index
git add -A
# commit all changes with the message 'deploy'
git commit -m "$GIT_COMMIT_MESSAGE"
# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f $GIT_REPO_REMOTE $GIT_BRANCH_LOCAL:$GIT_BRANCH_REMOTE