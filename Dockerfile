ARG caffe_tag=cpu

FROM cachengo/caffe:$caffe_tag

ARG base_image=ubuntu:18.04

COPY . /facerec

WORKDIR /facerec

RUN pip install -r requirements.txt \
    && chmod a+x boot.sh

EXPOSE 5000

ENTRYPOINT ["./boot.sh"]