echo -n "" > .env
echo "uid=$(id -u)" >> .env
echo "gid=$(id -g)" >> .env
echo "hostname=$(hostname)" >> .env
echo "uname=${USER}" >> .env

