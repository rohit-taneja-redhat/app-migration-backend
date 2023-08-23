FROM registry.redhat.io/rhel9/python-39:1-133.1692772345 as builder

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install cryptography=3.1.1 --no-binary cryptography
RUN pip install -r requirements.txt

COPY ./api /opt/app-root/src/api
WORKDIR /opt/app-root/src/api
EXPOSE 8080
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8080", "reload"] 
