#!/bin/bash
set -e

echo "Starte Spark Worker..."
$SPARK_HOME/sbin/start-worker.sh spark://spark-master:7077
echo "Spark Worker gestartet"


echo "Öffne interaktive Shell..."
exec /bin/bash



