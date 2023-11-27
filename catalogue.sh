set -x
#log= /tmp/roboshop.log
echo -e "\e[32m>>>>>>>>>>> Create Catalogue Service <<<<<<<<<<<<\e[0m"
#cp catalogue.service /etc/systemd/system/catalogue.service &>>${log}
cp catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[32m>>>>>>>>>>> Create Mongo Repo <<<<<<<<<<<<\e[0m"
#cp mongo.repo /etc/yum.repos.d/mongo.repo &>>${log}
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[32m>>>>>>>>>>> Disable nodejs old module and enable node 18 module<<<<<<<<<<<<\e[0m"
#dnf module disable nodejs -y &>>${log}
#dnf module enable nodejs:18 -y &>>${log}
dnf module disable nodejs -y
dnf module enable nodejs:18 -y

echo -e "\e[32m>>>>>>>>>>> Install NodeJS <<<<<<<<<<<<\e[0m"
#dnf install nodejs -y &>>${log}
dnf install nodejs -y

echo -e "\e[32m>>>>>>>>>>> Add application User <<<<<<<<<<<<\e[0m"
#useradd roboshop &>>${log}

echo -e "\e[32m>>>>>>>>>>> setup an app directory <<<<<<<<<<<<\e[0m"
#mkdir /app &>>${log}

#echo -e "\e[32m>>>>>>>>>>> Download the application code to created app directory <<<<<<<<<<<<\e[0m"
#curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>${log}
#cd /app &>>${log}
#unzip /tmp/catalogue.zip &>>${log}
#
#echo -e "\e[32m>>>>>>>>>>> Lets download the dependencies <<<<<<<<<<<<\e[0m"
#cd /app &>>${log}
#npm install &>>${log}
#
#echo -e "\e[32m>>>>>>>>>>> install mongodb-client <<<<<<<<<<<<\e[0m"
#dnf install mongodb-org-shell -y &>>${log}
#
#echo -e "\e[32m>>>>>>>>>>> Load Catalogue Schema <<<<<<<<<<<<\e[0m" | tee -a ${log}
#mongo --host mongodb.prashdevops.online </app/schema/catalogue.js &>>${log}
#
#
#echo -e "\e[32m>>>>>>>>>>> Load the Catalogue service <<<<<<<<<<<<\e[0m" | tee -a ${log}
#systemctl daemon-reload &>>${log}
#systemctl enable catalogue &>>${log}
#systemctl restart catalogue &>>${log}
