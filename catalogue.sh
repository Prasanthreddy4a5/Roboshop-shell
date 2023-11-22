set -x

echo  ">>>>>>>>>>> Create Catalogue Service <<<<<<<<<<<<<"
cp catalogue.service /etc/systemd/system/catalogue.service

echo  ">>>>>>>>>>> Create Mongo Repo <<<<<<<<<<<<<"
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo  ">>>>>>>>>>> Disable nodejs old module and enable node 18 module<<<<<<<<<<<<<"
dnf module disable nodejs -y
dnf module enable nodejs:18 -y

echo  ">>>>>>>>>>> Install NodeJS <<<<<<<<<<<<<"
dnf install nodejs -y

echo  ">>>>>>>>>>> Add application User <<<<<<<<<<<<<"
useradd roboshop

echo  ">>>>>>>>>>> setup an app directory <<<<<<<<<<<<<"
mkdir /app

echo  ">>>>>>>>>>> Download the application code to created app directory <<<<<<<<<<<<<"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip

echo  ">>>>>>>>>>> Lets download the dependencies <<<<<<<<<<<<<"
cd /app
npm install

echo  ">>>>>>>>>>> install mongodb-client <<<<<<<<<<<<<"
dnf install mongodb-org-shell -y

echo  ">>>>>>>>>>> Load Catalogue Schema <<<<<<<<<<<<<"
mongo --host mongodb.prashdevops.online </app/schema/catalogue.js


echo  ">>>>>>>>>>> Load the Catalogue service <<<<<<<<<<<<<"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue
