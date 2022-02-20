PYTHON=3.9
BASENAME=$(shell basename $(CURDIR))
CONDA_CH=conda-forge defaults

env:
	conda create -n $(BASENAME)  python=$(PYTHON)

setup:
	conda install --file requirements.txt $(addprefix -c ,$(CONDA_CH))
	pip install -r requirements-pip.txt  # separated for M1 chips

broker:
	docker run -d -p 6379:6379 redis

workers:
	# auto-restart for script modifications
	watchmedo auto-restart \
		--directory=worker \
		--pattern=*.py \
		--recursive -- \
		celery -A src.worker.celery worker -P gevent -c 1000 -l INFO

apis:
	uvicorn src.api.server:app --reload --host 0.0.0.0 --port 8000

dashboard:
	sh -c "./wait_for_workers.sh"
	celery -A src.worker.celery flower --port=5555


# For developers
setup-dev:
	conda install --file requirements-dev.txt $(addprefix -c ,$(CONDA_CH))
	pre-commit install

format:
	black .
	isort .

lint:
	pytest src --flake8 --pylint --mypy

utest:
	PYTHONPATH=src pytest test/utest --cov=src --cov-report=html --cov-report=term --cov-config=setup.cfg

cov:
	open htmlcov/index.html
