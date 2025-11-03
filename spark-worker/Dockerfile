#FROM spark:3.5.1-scala2.12-java17-ubuntu
FROM spark:3.5.4-scala2.12-java17-python3-ubuntu
#FROM spark:3.4.1-scala2.12-java11-python3-r-ubuntu

USER root

RUN set -ex; \
    apt-get update && \
    apt-get install -y python3 python3-pip && \
#    apt-get install -y openjdk-11-jdk && \
    rm -rf /var/lib/apt/lists/*

#ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-arm64
ENV PATH=$PATH:$JAVA_HOME/bin


# Install PySpark
RUN pip3 install --upgrade pip
COPY  requirements.txt .
RUN pip3 install -r requirements.txt
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar $SPARK_HOME/jars/
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar $SPARK_HOME/jars/
ADD https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.49.0.0/sqlite-jdbc-3.49.0.0.jar $SPARK_HOME/jars/sqlite-jdbc.jar
RUN rm -f requirements.txt

# Setze SPARK_SUBMIT_OPTIONS als Umgebungsvariable
#ENV PYSPARK_SUBMIT_ARGS="--packages io.delta:delta-spark_2.12:3.2.0 \
#  --conf spark.sql.extensions=io.delta.sql.DeltaSparkSessionExtension \
#  --conf spark.sql.catalog.spark_catalog=org.apache.spark.sql.delta.catalog.DeltaCatalog pyspark-shell"

# Setze SPARK_HOME und PATH
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/sbin
RUN mkdir -p /opt/spark/spark-events

#COPY hadoop-metrics2-s3a-file-system.properties /opt/spark/conf/

COPY spark-defaults.conf /opt/spark/conf/spark-defaults.conf
COPY hive-site.xml /opt/spark/conf/hive-site.xml
#RUN pip install jupyterlab
# Kopiere das Entry-Point-Skript in den Container
COPY entrypoint.sh /entrypoint.sh

# Stelle sicher, dass das Skript ausführbar ist
RUN chmod +x /entrypoint.sh


#USER spark
# Add PySpark to PATH for the spark user
#ENV PATH=$PATH:/home/spark/.local/bin

# Setze das Skript als ENTRYPOINT, sodass es beim Containerstart automatisch ausgeführt wird
ENTRYPOINT ["/entrypoint.sh"]

