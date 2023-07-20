FROM apache/hadoop-runner

#ARG JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:jre/bin/java::")
#ARG HW_HADOOP_DIR=/opt/home/cs172-s22/hadoop
#ARG HADOOP_HW_DIR=/opt/home/cs172-s22/hadoop
#ARG HADOOP_VERSION=3.3.1
#ARG HADOOP_HOME=/opt/home/cs172-s22/hadoop-3.3.1
#ARG HADOOP_PREFIX=$HADOOP_HOME
#ARG HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
#ARG PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
#ARG CLASSPATH=/opt/home/cs172-s22/lucene-8.11.1/core/lucene-core-8.11.1.jar:/opt/home/cs172-s22/lucene-8.11.1/queryparser/lucene-queryparser-8.11.1.jar:/opt/home/cs172-s22/lucene-8.11.1/analysis/common/lucene-analyzers-common-8.11.1.jar:/opt/home/cs172-s22/lucene-8.11.1/demo/lucene-demo-8.11.1.jar:$CLASSPATH:.
#ARG JSVC_HOME=${JSVC_HOME}

#ARG HADOOP_CLASSPATH=$f
#ARG HADOOP_HEAPSIZE=
#ARG HADOOP_NAMENODE_INIT_HEAPSIZE=""
#ARG HADOOP_OPTS="$HADOOP_OPTS -Djava.net.preferIPv4Stack=true"
#ARG HADOOP_NAMENODE_OPTS="-Dhadoop.security.logger=${HADOOP_SECURITY_LOGGER:-INFO,RFAS} -Dhdfs.audit.logger=${HDFS_AUDIT_LOGGER:-INFO,NullAppender} $HADOOP_NAMENODE_OPTS"
#ARG HADOOP_DATANODE_OPTS="-Dhadoop.security.logger=ERROR,RFAS $HADOOP_DATANODE_OPTS"
#ARG HADOOP_SECONDARYNAMENODE_OPTS="-Dhadoop.security.logger=${HADOOP_SECURITY_LOGGER:-INFO,RFAS} -Dhdfs.audit.logger=${HDFS_AUDIT_LOGGER:-INFO,NullAppender} $HADOOP_SECONDARYNAMENODE_OPTS"
#ARG HADOOP_NFS3_OPTS="$HADOOP_NFS3_OPTS"
#ARG HADOOP_PORTMAP_OPTS="-Xmx512m $HADOOP_PORTMAP_OPTS"
#ARG HADOOP_CLIENT_OPTS="-Xmx512m $HADOOP_CLIENT_OPTS"
#ARG HADOOP_JAVA_PLATFORM_OPTS="-XX:-UsePerfData $HADOOP_JAVA_PLATFORM_OPTS"
#ARG HADOOP_SECURE_DN_USER=${HADOOP_SECURE_DN_USER}
#ARG HADOOP_LOG_DIR=${HADOOP_LOG_DIR}/$USER
#ARG HADOOP_SECURE_DN_LOG_DIR=${HADOOP_LOG_DIR}/${HADOOP_HDFS_USER}
#ARG HADOOP_MOVER_OPTS=""
#ARG HADOOP_PID_DIR=${HADOOP_PID_DIR}
#ARG HADOOP_SECURE_DN_PID_DIR=${HADOOP_PID_DIR}
#ARG HADOOP_IDENT_STRING=$USER

RUN yum makecache fast
#Unsure if this is really needed, but apache said it was. May not be if 
RUN sudo yum install -y ssh pdsh

#Note: I'm not an expert but there has to be a way to detect the stable version instead of outright hardcoding it

#Download the Hadoop files in etc
RUN cd /etc/
RUN wget https://dlcdn.apache.org/hadoop/common/stable/hadoop-3.3.4.tar.gz --no-check-certificate
RUN tar -xf hadoop-3.3.4.tar.gz

#May need to verify keys? Unsure.

#Extract out into normal staging area "home"
RUN mv hadoop-3.3.4/* .

#Remove extraneous folder
RUN rm -rf hadoop-3.3.4


#Tested Base Image, Tested simple example script from apache website
#Volume not tested, but could be set up into /usr/home/
#Note that the current home directory is set to /opt/hadoop/

CMD [ "sleep", "infinity" ]