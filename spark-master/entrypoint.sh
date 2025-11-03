#!/bin/bash
set -e

echo "Starte Spark Master..."
start-master.sh

echo "Öffne interaktive Shell"
exec jupyter notebook --port=8888 --NotebookApp.token='' --allow-root --ip=0.0.0.0

