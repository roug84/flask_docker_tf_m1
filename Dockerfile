# start by pulling the python image
FROM ubuntu:22.04

RUN apt update && apt install

RUN apt install -y python3-pip

RUN apt install python3-dev

RUN apt install build-essential

RUN apt install libssl-dev

RUN apt install libffi-dev

RUN apt install python3-setuptools

RUN apt install -y python3-venv

RUN apt-get install -y git

RUN git clone https://github.com/roug84/flask_docker_tf_m1.git

#RUN CD flask_docker_tf_m1

RUN pip install gunicorn flask python-dotenv pandas requests

WORKDIR /flask_docker_tf_m1

EXPOSE 8000

CMD [ "python3", "app.py" ]

#ENTRYPOINT [ "python" ]

#CMD exec gunicorn --bind localhost:8000 --workers 1 --threads 1 --timeout 0 app:app

# docker run -t --rm -p 0.0.0.0:8501:8501 --mount type=bind,source=/Users/hector/DiaHecDev/results/Models_DL/servingpa,target=/models/servingpa/1/ -e MODEL_NAME=servingpa emacski/tensorflow-serving:latest-linux_arm64
# docker compose run --service-ports pareco
