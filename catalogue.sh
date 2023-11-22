set -x

echo -e "\e[32m>>>>>>>>>>> Create Catalogue Service <<<<<<<<<<<<\e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[32m>>>>>>>>>>> Create Mongo Repo <<<<<<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[32m>>>>>>>>>>> Disable nodejs old module and enable node 18 module<<<<<<<<<<<<\e[0m"
dnf module disable nodejs -y
dnf module enable nodejs:18 -y

echo -e "\e[32m>>>>>>>>>>> Install NodeJS <<<<<<<<<<<<\e[0m"
dnf install nodejs -y

echo -e "\e[32m>>>>>>>>>>> Add application User <<<<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[32m>>>>>>>>>>> setup an app directory <<<<<<<<<<<<\e[0m"
mkdir /app

echo -e "\e[32m>>>>>>>>>>> Download the application code to created app directory <<<<<<<<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip

echo -e "\e[32m>>>>>>>>>>> Lets download the dependencies <<<<<<<<<<<<\e[0m"
cd /app
npm install

echo -e "\e[32m>>>>>>>>>>> install mongodb-client <<<<<<<<<<<<\e[0m"
dnf install mongodb-org-shell -y

echo -e "\e[32m>>>>>>>>>>> Load Catalogue Schema <<<<<<<<<<<<\e[0m"
mongo --host mongodb.prashdevops.online </app/schema/catalogue.js


echo -e "\e[32m>>>>>>>>>>> Load the Catalogue service <<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue
