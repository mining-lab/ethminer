FROM nvidia/cuda:9.2-devel

WORKDIR /opt/ethminer

RUN apt-get update && \
  apt-get install -y --no-install-recommends wget ca-certificates libcurl4-openssl-dev && \
  rm -rf /var/lib/apt/lists/* && \
  wget -O - 'https://github.com/ethereum-mining/ethminer/releases/download/v0.16.1/ethminer-0.16.1-linux-x86_64.tar.gz' | tar zxvf - --strip=1

ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

CMD ["./ethminer", "--help"]
