
docker-build:
	docker build -t rails-tutorial .

run:
	docker run -p 3000:3000 -v $(PWD):/myapp rails-tutorial rails s

test:
	docker run -v $(PWD):/myapp rails-tutorial rails test

guard:
	docker run -it -v $(PWD):/myapp rails-tutorial bundle exec guard

ARG = rails console
bundle-exec:
	docker run -it -v $(PWD):/myapp rails-tutorial bundle exec ${ARG}

