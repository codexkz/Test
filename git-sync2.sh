export SOURCE=/Users/light/Desktop/RESTserver/git-sync

if [[ -f $SOURCE/.github_token ]]
then
  export GITHUB_TOKEN=$(cat $SOURCE/.github_token)
fi


if [[ -f $SOURCE/.gitlab_token ]]
then
  export GITLAB_API_PRIVATE_TOKEN=$(cat $SOURCE/.gitlab_token)
fi
export GITLAB_API_ENDPOINT="https://gitlab.com/api/v4"


export GIT_USER_NAME=lightning11
export GIT_REPO_NAME=Test

##  If you don't have a git repo yet
mkdir $GIT_REPO_NAME && cd $GIT_REPO_NAME
git init
hub create
gitlab create_project $GIT_REPO_NAME "{visibility_level: 20}"

git remote set-url origin --add https://gitlab.com/${GIT_USER_NAME}/${GIT_REPO_NAME}.git
git remote add origin-gitlab https://gitlab.com/${GIT_USER_NAME}/${GIT_REPO_NAME}.git
git remote -v
