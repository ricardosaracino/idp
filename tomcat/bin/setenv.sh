export JAVA_OPTS="-Djavax.net.ssl.trustStore=/home/testmgr/SSL/jssecacerts"
export CATALINA_OPTS="-server -Xmx673m -XX:MaxPermSize=256m -Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2"
export LD_LIBRARY_PATH="/usr/local/tomcat/lib"
