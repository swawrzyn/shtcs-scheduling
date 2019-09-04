FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

# changing alpine linux apk mirror to china
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories

# RUN apk add --update --no-cache postgresql-client
# RUN apk add --no-cache --virtual .tmp-build-deps \
#     gcc libc-dev linux-headers postgresql-dev curl alpine-sdk

# added -i to change to china based mirror for pip
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r /requirements.txt

# RUN apk del .tmp-build-deps

RUN mkdir /web

WORKDIR /web

COPY . /web

RUN adduser -D user
USER user

CMD ["python", "app.py"]