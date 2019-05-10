build:
	docker build -t leerberg/dynamodb:latest .
ifndef BUILD_NUM
	$(warning No build number is defined, skipping build number tag.)
else
	docker build -t leerberg/dynamodb:$(BUILD_NUM) .	
endif

deploy: 
	docker push leerberg/dynamodb:latest
ifndef BUILD_NUM
	$(warning No build number is defined, skipping push of build number tag.)
else
	docker push leerberg/dynamodb:$(BUILD_NUM)
endif
