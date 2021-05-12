FROM ubuntu
RUN apt-get update \
    && apt-get install build-essential net-tools wget openssl zlib1g zlib1g.dev libssl-dev libffi-dev libsqlite3-dev -y \
    && wget https://www.python.org/ftp/python/3.7.0/Python-3.7.10.tgz \
    && tar zxvf Python-3.7.10.tgz \
    && cd Python-3.7.10 && ./configure --prefix=/usr/local/python3 --with-ssl && make && make install \
    && ln -s /usr/local/python3/bin/python3 /bin/python \
    && ln -s /usr/local/python3/bin/pip3 /bin/pip \
    && rm -rf Python-3.7.10.tgz Python-3.7.10

RUN pip install -U pip \
    && pip install urllib3 certifi mitmproxy \
    && ln -s /usr/local/python3/bin/mitmdump /usr/bin/mitmdump \
    && ln -s /usr/local/python3/bin/mitmproxy /usr/bin/mitmproxy \

RUN mkdir -p /mock
WORKDIR /mock

EXPOSE 8080

CMD ["mitmdump", "-q", "-p", "8080", "-s", "mock.py"]


