#!/bin/sh

export HADOOP_HOME=/opt/hadoop-3.3.4
export HADOOP_CLASSPATH=${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.12.262.jar:${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-3.3.4.jar:${HADOOP_HOME}/share/hadoop/tools/lib/delta-hive-assembly_2.11-3.3.0.jar
export JAVA_HOME=/usr/local/openjdk-8

/opt/apache-hive-metastore-3.1.2-bin/bin/schematool -initSchema -dbType postgres
/opt/apache-hive-metastore-3.1.2-bin/bin/start-metastore