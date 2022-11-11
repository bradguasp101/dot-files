export JAVA_8=$(/usr/libexec/java_home -v 1.8.0)
export JAVA_16=$(/usr/libexec/java_home -v 16)
export JAVA_HOME=$JAVA_8

alias java8='export JAVA_HOME=$JAVA_8; java -version'
alias java16='export JAVA_HOME=$JAVA_16; java -version'

