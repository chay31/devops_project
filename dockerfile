FROM python:3.9-slim


WORKDIR /app


COPY requirements.txt requirements.txt
COPY app /app


RUN pip install -r requirements.txt


EXPOSE 80


CMD ["python", "app.py"]
