build:
	docker build -t leerberg/dynamodb:latest .
ifdef CIRCLE_BUILD_NUM
	docker build -t leerberg/dynamodb:$(CIRCLE_BUILD_NUM) .	
endif

deploy: 
	docker push leerberg/dynamodb:latest
ifdef CIRCLE_BUILD_NUM
	docker push leerberg/dynamodb:$(CIRCLE_BUILD_NUM)
endif

