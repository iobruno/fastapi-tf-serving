.PHONY: setup run

setup:
	@poetry install --no-root

run:
	@uvicorn app.main:app --reload
