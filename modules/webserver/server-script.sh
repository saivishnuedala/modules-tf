#!/bin/bash
# sudo yum update -y && sudo yum install -y docker
# sudo systemctl start docker
# sudo usermod -aG docker ec2-user
# docker run -p 8080:80 nginx


#!/bin/bash
# Set variables
TOMCAT_VERSION="9.0.50"
INSTALL_DIR="/opt/tomcat"

# Download Tomcat 9
wget https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Extract Tomcat archive
tar -xf apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Move Tomcat files to installation directory
mv apache-tomcat-${TOMCAT_VERSION} ${INSTALL_DIR}

# Configure Tomcat
chmod +x ${INSTALL_DIR}/bin/*.sh
sed -i 's/port="8080"/port="80"/' ${INSTALL_DIR}/conf/server.xml

# Start Tomcat service
${INSTALL_DIR}/bin/startup.sh


amazon-linux-extras install java-openjdk11
java -version
wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz
unzip apache-tomcat-8.0.23.tar.gz
cd apache-tomcat-8.0.23.tar.gz
ll
cd bin
ll
./shutdown
./startup


sudo yum install java-1.8*
java -version
sudo su -

cd /

cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
tar -xvf apache-tomcat-9.0.71.tar.gz
mv apache-tomcat-9.0.71 tomcat9
sudo useradd -r tomcat
chown -R tomcat:tomcat /opt/tomcat9


sudo ln -sf /opt/apache-tomcat-9.0.55/bin/startup.sh /usr/local/bin/tomcatup


Create a file (test.txt) with content as ""I love machine, I am into devops cloud

Write a shell script which has to replace machine into DevOps in above file
Then print the no of occurences of devops as output when we execute shell file

NACL vs Security Group"