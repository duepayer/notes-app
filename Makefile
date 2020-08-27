build: 
	export GO111MODULE=on
	go mod vendor
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello app/lambdas/apigw/hello/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/world app/lambdas/apigw/world/main.go

clean:
	rm -rf ./bin ./vendor

deploy: clean build
	sls deploy --verbose
