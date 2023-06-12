#! /bin/bash


if 
   [[ $# -ne 1 ]]
then
echo "OooooooooooH NOOOOOOOOH, please provide only one argument"
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
[[ ${SESSION} == s2 ]] || [[ ${SESSION} == s3 ]] || [[ ${SESSION} == s4 ]] || [[ ${SESSION} == s5 ]] || [[ ${SESSION} == s6 ]]
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
chmod 400 key-file
GIT_SSH_COMMAND="ssh -i key-file" git clone git@github.com:devopseasylearning/S6-projects.git

git config --global user.name "devopseasylearning"
git config --global user.email info@devopseasylearning.com
cd Server-login-key/keys
cat  ~/.ssh/id_rsa.pub > ./$1.pem
git add -A 
git commit -m "adding $1.pem"
GIT_SSH_COMMAND="ssh -i key-file" git push 

cd - && rm -rf Server-login-key
echo "INSTRUCTIONS"
echo "`whoami` Bingo you made it, just let the rest for us'"
