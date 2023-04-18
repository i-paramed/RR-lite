build:
	docker build -t rr:latest .

run:
	docker run -it --rm -v $(PWD):/app -w /app rr:latest bash

test:
	docker run -it --rm -v $(PWD):/app -w /app rr:latest bash -c "poetry install && cd /app/rr/examples && python main_rr_estimation.py"