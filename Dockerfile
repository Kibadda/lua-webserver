FROM debian:bookworm

RUN apt-get update

RUN apt-get -y install --no-install-recommends wget gnupg ca-certificates build-essential sqlite3 npm

RUN wget -O - https://openresty.org/package/pubkey.gpg | apt-key add -

RUN echo "deb http://openresty.org/package/debian bullseye openresty" | tee /etc/apt/sources.list.d/openresty.list

RUN echo "deb http://openresty.org/package/arm64/debian bullseye openresty" | tee /etc/apt/sources.list.d/openresty-arm.list

RUN apt-get update

RUN apt-get -y install --no-install-recommends openresty

RUN apt-get -y install --no-install-recommends luarocks libssl-dev libsqlite3-dev

RUN luarocks install lsqlite3

RUN luarocks install lapis

RUN luarocks install bcrypt

RUN npm install -g sass

WORKDIR /home/lua-webserver

ENTRYPOINT ["./entrypoint.sh"]
