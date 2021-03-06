# Must ./update first. Requires existence of .tmp/versions.txt

# remove any previous file
touch .tmp/official-commits
rm .tmp/official-commits
sed 's/^/# maintainer /g' MAINTAINERS >> .tmp/official-commits
echo '' >> .tmp/official-commits

while read line
do
    name=$line
    if [ "$line" != "" ] && [[ $line != v0.5* ]]; then
        sed s/{folder}/"versions\/$line"/g official.template |
            sed s/{raw-version}/${line#"v"}/g |
            sed s/{commit}/$(git rev-parse HEAD)/g >> .tmp/official-commits
    fi
done < .tmp/versions.txt

LATEST=$(tail -1 .tmp/versions.txt)
sed s/{folder}/"versions\/$LATEST"/g official.template |
    sed s/{raw-version}/latest/g |
    sed s/{commit}/$(git rev-parse HEAD)/g >> .tmp/official-commits
