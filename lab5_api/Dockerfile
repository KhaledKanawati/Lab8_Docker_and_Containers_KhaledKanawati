FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 LAB8_DATABASE_PATH=/data/database.db
WORKDIR /app
COPY lab5_api/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY lab5_api /app/lab5_api
RUN mkdir -p /data
EXPOSE 5000
CMD ["python", "-m", "lab5_api.app"]
