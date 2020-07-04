FROM python:stretch

COPY . /app
WORKDIR /app

# run
RUN apt-get update -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt


ENTRYPOINT ["gunicorn", "-b", ":8080","main:APP"]

# docker run --rm  --name demo03  --env-file env_file -p 80:8080 myte