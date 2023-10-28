#!/bin/sh

if [ $# -eq 0 ]; then
  exit 1
fi

case "$1" in 
  migrate)
    echo "migrating database"
    lapis migrate
    exit 0
    ;;

  serve)
    echo "serving web application"
    lapis serve
    exit 0
    ;;

  bash)
    echo "starting interactive bash"
    bash
    exit 0
    ;;

  db)
    echo "starting database"
    sqlite3 database/db.sqlite
    exit 0
    ;;

  seed)
    echo "seeding admin user"
    lapis exec 'require"seed"'
    exit 0
    ;;

  sass)
    echo "compiling scss"
    sass static/css/app.scss static/css/app.css -w
    exit 0
    ;;

  *)
    echo "$1 is not a valid option"
    exit 1
    ;;
esac
