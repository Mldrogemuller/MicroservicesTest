install:
    #install commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt
format:
	#format code
	black *.py mylib/*.py
lint:
#flake8 or #pylint
	pylint --disable=R,C mylib/*.py *.py

test:
	#test
	python -m pytest -vv --cov=mylib test_logic.py
build:
	#build container
	docker build -t deploy-fastapi .
run:
	#run docker
	#docker run -p 127.0.0.1:8080:8080 6249388e112f
deploy:
    #deploy
all: install lint test deploy