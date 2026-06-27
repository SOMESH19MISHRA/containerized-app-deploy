#Using a python base image
FROM python:3.9-slim

#Setting working directory
WORKDIR /app

#Coping in
COPY . .

#Installing Requirements
RUN pip install -r requirements.txt

#Command to start the app
CMD ["python","app.py"]
