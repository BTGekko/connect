#!/bin/bash
name=$1
pwd1=$2
if [ -n "$name" ]; then 
  if [ -n "$pwd1" ]; then
echo ""
else echo "If input username, you should also please input password for mongodb"
 exit 1
  fi
fi
TMP_NUCLIAS_CONNECT=/usr/local/nuclias_connect
TMP_NUCLIAS_CONNECT_config=/usr/local/nuclias_connect/config
if [ ! -d $TMP_NUCLIAS_CONNECT ];then
  mkdir -p $TMP_NUCLIAS_CONNECT
fi

cd $TMP_NUCLIAS_CONNECT
echo " "

echo -e "\033[36m--- Download config files---\033[0m"
echo " "
curl -o init.sh https://github.com/BTGekko/connect/blob/master/init.sh
curl -o docker-compose.yml https://github.com/BTGekko/connect/blob/master/docker-compose.yml
curl -o entrypoint-initdb.sh https://github.com/BTGekko/connect/blob/master/entrypoint-initdb.sh
curl -o appconfig.json https://github.com/BTGekko/connect/blob/master/appconfig.json
if [ ! -d $TMP_NUCLIAS_CONNECT_config ];then
  mkdir -p $TMP_NUCLIAS_CONNECT_config
fi
cd $TMP_NUCLIAS_CONNECT_config
curl -o systemconfig.json https://github.com/BTGekko/connect/blob/master/config/systemconfig.json
cd $TMP_NUCLIAS_CONNECT
echo -e "\033[32m--- Download Complete\033[0m"
echo " "

sudo sh init.sh $name $pwd1
