#FILES=$(find . -maxdepth 1 -mindepth 1 -name '.*')
for f in ""
do
ln -s $(readlink -f $f) ~
done
