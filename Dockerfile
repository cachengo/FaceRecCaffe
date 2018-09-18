ARG base_image=ubuntu:18.04

FROM $base_image

ARG base_image=ubuntu:18.04

RUN if [ "$base_image" = "ubuntu:18.04" ] ; then \
    apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt-get install -y python python-pip python-dev \
    && pip install numpy \
    && apt-get install -y python-opencv caffe-cpu \
    ; fi

COPY . /facerec

WORKDIR /facerec

RUN pip install -r requirements.txt \
    && chmod a+x boot.sh

EXPOSE 5000

ENTRYPOINT ["./boot.sh"]