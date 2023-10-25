.PHONY: build serve sass

build:
	docker build -t lua-webserver .

serve:
	docker run -p 8080:8080 -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest

sass:
	sass static/css/app.scss static/css/app.css -w
