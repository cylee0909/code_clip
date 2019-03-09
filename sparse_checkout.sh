# !/bin/bash
cd `dirname $0`
DIR_NAME=.cache_test
if [ ! -d $DIR_NAME ];then
	mkdir $DIR_NAME
fi
cd $DIR_NAME

git remote -v &>/dev/null
if [ $? -eq 0 ]; then
    echo "git remote exist..."
else
	echo "init..."
    git init
	git remote add origin https://github.com/cylee0909/xmodule.git
	git config core.sparsecheckout true
	echo "app/src/main/api" >> .git/info/sparse-checkout
fi
cat ./.git/info/sparse-checkout 
git pull origin master
cp -r app/src/main/api ../xmodule_test