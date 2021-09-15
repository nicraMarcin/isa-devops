FROM python:3.8

WORKDIR /app

COPY . .
RUN python -m pip install -r requirements.txt

ENTRYPOINT [ "python","/app/app.py" ]
