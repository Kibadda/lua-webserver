.PHONY: build serve sass migrate bash db

build:
	docker build -t lua-webserver .

migrate:
	docker run -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest migrate

bash:
	docker run -p 8080:80 -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest bash

db:
	docker run -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest db

seed:
	docker run -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest seed

serve:
	docker run -p 8080:8080 -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest serve

sass:
	docker run -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest sass

production:
	docker run -d -p 80:80 -p 443:443 -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest production
