
# 使用vim查看某个文件不同版本间的改动

# git config --global diff.tool vimdiff
# git config --global difftool.prompt false

# 工作区 - 暂存区 不带参数
# 工作区 - version  一个参数
# 暂存区 - version x2
# version1 - version2 x2

filename=`git ls-files|fzf --reverse --inline-info`
test -z $filename && exit

getFileCommit(){
    git log --pretty=format:"%h%%%d%s(%cr)<%an>" $1|sed "1iStage%暂存区"|sed "1iCurrent%工作区"|awk -F '%' '{printf("%-10s%-s\n",$1,$2)}'
}
version1=$(getFileCommit $filename|fzf --reverse --inline-info|awk '{print $1}')
test -z $version1 && exit
nr=$(getFileCommit $filename|grep -n $version1)
nr=${nr%:*}
version2=$(getFileCommit $filename $filename| sed "1,${nr}d"|fzf --reverse --inline-info|awk '{print $1}')
test -z $version2 && exit


if [ "$version1" = "Current" ];then
    if [ "$version2" = "Stage" ];then
        git difftool -y $filename
    else
        git difftool -y $version2  $filename
    fi
elif [ "$version1" = "Stage" ];then
    git difftool -y --cached $version2 $filename
else
    git difftool -y $version1 $version2 $filename
fi
