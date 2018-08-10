

docker-build:
	docker build -t rails-tutorial .

docker-run:
	docker run -p 3000:3000 -v $(PWD):/myapp rails-tutorial rails s

