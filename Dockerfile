# docker build -t reporter .
# docker run -it -v $(pwd):/usr/reporter -p 5000:80 --rm reporter

FROM python:3.7

# install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -q -y \
    bash \
    vim \
    curl \
    libhdf5-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/reporter

COPY ./requirements_pip.txt /usr/reporter/requirements_pip.txt
RUN pip install -r requirements_pip.txt

VOLUME ["/usr/reporter"]
EXPOSE 80
EXPOSE 443

#CMD ["python", "./app.py"]
#CMD ["py.test", "-s", "./tests"]
CMD ["/bin/bash"]
#CMD ["FLASK_APP=reporter/api.py", "flask", "run", "--host=0.0.0.0"]
