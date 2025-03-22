FROM rust:1.84

RUN apt-get update
RUN apt-get install -y \
build-essential \
pkg-config \
libudev-dev llvm libclang-dev \
protobuf-compiler

RUN mkdir /tmp/build 
WORKDIR /tmp/build

RUN git clone https://github.com/thehydrogensonata/agave.git
WORKDIR /tmp/build/agave 
RUN git switch fex


RUN ./scripts/cargo-install-all.sh .

ENV PATH=/tmp/build/agave/bin:$PATH

RUN cargo build --bin solana-test-validator

RUN solana-keygen new -o /root/.config/solana/id.json --no-bip39-passphrase
RUN solana config set --url http://127.0.0.1:8899

RUN solana-keygen new -o ./alice.json --no-bip39-passphrase
RUN solana-keygen new -o ./bob.json --no-bip39-passphrase
