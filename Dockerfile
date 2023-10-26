FROM debian:bookworm

RUN apt-get update

RUN apt-get -y install --no-install-recommends wget gnupg ca-certificates build-essential sqlite3

RUN wget -O - https://openresty.org/package/pubkey.gpg | apt-key add -

RUN echo "deb http://openresty.org/package/debian bullseye openresty" | tee /etc/apt/sources.list.d/openresty.list

RUN apt-get update

RUN apt-get -y install --no-install-recommends openresty

RUN apt-get -y install --no-install-recommends luarocks libssl-dev libsqlite3-dev

RUN luarocks install lsqlite3

RUN luarocks install lapis

RUN luarocks install bcrypt

WORKDIR /home/lua-webserver

EXPOSE 8080

VOLUME /home/lua-webserver

ENTRYPOINT ["./entrypoint.sh"]
