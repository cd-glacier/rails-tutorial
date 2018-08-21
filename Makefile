
docker-build:
	docker build -t rails-tutorial .

run:
	docker run --rm -it -p 3000:3000 -v $(PWD):/myapp rails-tutorial bundle exec rails s

test:
	docker run --rm -v $(PWD):/myapp rails-tutorial rails test

guard:
	docker run --rm -it -v $(PWD):/myapp rails-tutorial bundle exec guard

ARG = rails console --sandbox
bundle-exec:
	docker run --rm -it -v $(PWD):/myapp rails-tutorial bundle exec ${ARG}

