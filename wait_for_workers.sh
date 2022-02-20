#!/bin/sh
until celery -A src.worker.celery inspect ping; do
    echo "Celery workers not available"
    sleep 1
done
