FROM spark:3.5.4-scala2.12-java17-python3-ubuntu

USER root

RUN set -ex; \
    apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*
ENV PATH=$PATH:$JAVA_HOME/bin
# Install PySpark
RUN pip3 install --upgrade pip
COPY  requirements.txt .
RUN pip3 install -r requirements.txt
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar $SPARK_HOME/jars/
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar $SPARK_HOME/jars/
ADD https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.49.0.0/sqlite-jdbc-3.49.0.0.jar $SPARK_HOME/jars/sqlite-jdbc.jar
RUN rm -f requirements.txt

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/sbin
RUN mkdir -p /opt/spark/spark-events

COPY spark-defaults.conf /opt/spark/conf/spark-defaults.conf
COPY hive-site.xml /opt/spark/conf/hive-site.xml
RUN pip install jupyterlab

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Setze das Skript als ENTRYPOINT, sodass es beim Containerstart automatisch ausgeführt wird
ENTRYPOINT ["/entrypoint.sh"]

