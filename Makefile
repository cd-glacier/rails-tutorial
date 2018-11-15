.PHONY: help
.DEFAULT_GOAL := help

docker-build: ## build image for this repository
	docker build -t rails-tutorial .

run: ## docker run
	docker run --rm -it -p 3000:3000 -v $(PWD):/myapp rails-tutorial bundle exec rails s

test: ## run rails test
	docker run --rm -v $(PWD):/myapp rails-tutorial rails test

guard: ## run guard
	docker run --rm -it -v $(PWD):/myapp rails-tutorial bundle exec guard

ARG = rails console --sandbox
bundle-exec: ## run `bundle exec ${ARG}`. default is bundle exec console --sandbox
	docker run --rm -it -v $(PWD):/myapp rails-tutorial bundle exec ${ARG}

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

