#! /bin/bash

### checking if you have a key
# read -p "Enter your prefer_name: " NAME
if 
   [[ $# -ne 1 ]]
then
echo "this script required only one argument which is your prefer name to run"
 exit 1
fi 

if 
   [[ -z $1 ]]
then
echo "your did not enter your prefer name"
 exit 1
fi 


SESSION=`echo $1 |  awk '{print substr($0,1,2)}'`

if 
[[ ${SESSION} == s2 ]] || [[ ${SESSION} == s3 ]] || [[ ${SESSION} == s4 ]] || [[ ${SESSION} == s5 ]] || [[ ${SESSION} == s6 ]] || [[ ${SESSION} == s7 ]]
then 
echo "looks good"
else 
echo "wrong prefer name"
exit 1

fi 


KEY=$(ls -l ~/.ssh | grep -io id_rsa.pub)

if 
  [[ ${KEY} == id_rsa.pub  ]]
then 
echo "you are good to go "
rm -rf ~/Downloads/$1.pem || true
cp -r ~/.ssh/id_rsa.pub  ~/Downloads/$1.pem

ls -l | grep -io ~/Downloads/$1.pem
echo "KEY COPY "
elif 
  [[ ${KEY} != id_rsa.pub  ]] 
then 
  mkdir ~/.ssh || true 
  cd ~/.ssh
  yes id_rsa  | ssh-keygen -q -t rsa -N '' >/dev/null
clear
echo "CREATE AND KEY COPY"
fi 

echo 
echo 

rm -rf Server-login-key || true 
git clone https://devopseasylearning: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@github.com/devopseasylearning/Server-login-key.git 
git config --global user.name "devopseasylearning"
git config --global user.email info@devopseasylearning.com
cd Server-login-key/keys
cat  ~/.ssh/id_rsa.pub > ./$1.pem
git add -A 
git commit -m "adding $1.pem"
git push https://devopseasylearning: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@github.com/devopseasylearning/Server-login-key.git 

cd - && rm -rf Server-login-key
echo "INSTRUCTIONS"
echo "PLEASE NOTIFY ERIC VIA WHATSAPP at 832-342-0700"

clear 
sleep 3
echo "##########################"
echo "yah!!!!!!!!!!!!!!!!!!! $1 YOU MADE IT"
