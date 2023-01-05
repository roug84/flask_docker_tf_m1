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

RUN pip install gunicorn flask python-dotenv pandas

WORKDIR /flask_docker_tf_m1

CMD exec gunicorn --bind 0.0.0.0:8000 --workers 1 --threads 1 --timeout 0 app:app



#
#
## copy the requirements file into the image
#COPY ./requirements.txt /app/requirements.txt
#
## switch working directory
#WORKDIR /app
#
## install the dependencies and packages in the requirements file
#RUN pip install -r requirements.txt
#
## copy every content from the local file to the image
#COPY . /app
#
## configure the container to run in an executed manner
#ENTRYPOINT [ "python" ]
#
#CMD ["view.py" ]


#FROM ubuntu:16.04
#
#RUN apt-get update -y && \
#    apt-get install -y python-pip python-dev
#
##RUN pip install --upgrade pip
## We copy just the requirements.txt first to leverage Docker cache
#COPY ./requirements.txt /app/requirements.txt
#
#WORKDIR /app
#
#RUN pip install -r requirements.txt
#
#COPY . /app
#
#ENTRYPOINT [ "python" ]
#
#CMD [ "app.py" ]

#FROM ubuntu as intermediate
#RUN mkdir -p /models/servingpa/1/
#VOLUME /models/servingpa/1/
#COPY /Users/hector/DiaHecDev/results/Models_DL/servingpa/ saved_model.pb /models/servingpa/1/
#
##FROM nginx
##
##ADD /Users/hector/DiaHecDev/results/Models_DL/servingpa/ /models/servingpa/1/
#FROM emacski/tensorflow-serving:latest-linux_arm64
#
## Define metadata
#LABEL author="MakeML"
#LABEL version="1.0"
#LABEL description="Deploy tensorflow object detection model with MakeML"
#
## Copy model
##RUN docker run -t --rm -p 8501:8501 --mount type=bind,source=/Users/hector/DiaHecDev/results/Models_DL/servingpa,target=/models/servingpa/1/ -e MODEL_NAME=servingpa emacski/tensorflow-serving:latest-linux_arm64
#ARG MODEL_NAME=servingpa
##WORKDIR /models
##RUN mkdir -p /servingpa/1
###RUN mkdir -p /servingpa/1/variables
###ADD /Users/hector/DiaHecDev/results/Models_DL/servingpa/saved_model.pb servingpa/1/
#
##EXPOSE 80
##ENTRYPOINT ["tensorflow_model_server", "--model_base_path=/models/object-detect"]
##CMD ["--rest_api_port=80","--port=81"]
#
#
#
##RUN -t --rm -p 8501:8501 --mount type=bind,source=/Users/hector/DiaHecDev/results/Models_DL/servingpa,target=/models/servingpa/1/ -e MODEL_NAME=servingpa emacski/tensorflow-serving:latest-linux_arm64
#
##docker pull emacski/tensorflow-serving:latest-linux_arm64
#
##docker run -t --rm -p 8501:8501 --mount type=bind,source=/Users/hector/DiaHecDev/results/Models_DL/servingpa,target=/models/servingpa/1/ -e MODEL_NAME=servingpa emacski/tensorflow-serving:latest-linux_arm64
