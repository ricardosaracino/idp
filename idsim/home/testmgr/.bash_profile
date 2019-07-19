# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export JAVA_HOME=/usr/java/default
export JAVA_OPTS="-Dhttps.protocols=TLSv1 -Djavax.net.ssl.trustStore=${HOME}/SSL/jssecacerts"
export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin

if [ ! -d "$HOME/opensso" ] ; then
   ${HOME}/firstrun.sh
fi
