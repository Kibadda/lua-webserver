.PHONY: default bash db migrate sass seed serve production

default:
	echo -e "Available targets: \n  build\n  bash\n  db\n  migrate\n  sass\n  seed\n  serve\n  production\n"

build:
	docker build -t lua-webserver .

bash:
	docker run -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest bash

db:
	docker run -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest db

migrate:
	docker run -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest migrate

sass:
	docker run -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest sass

seed:
	docker run -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest seed

serve:
	docker run -p 8080:80 -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest serve

production:
	docker run -d -p 80:80 -p 443:443 -it --mount type=bind,source="$(PWD)",target=/home/lua-webserver lua-webserver:latest production
