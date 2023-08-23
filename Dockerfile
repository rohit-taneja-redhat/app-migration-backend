FROM registry.redhat.io/rhel9/python-39:1-133.1692772345 as builder

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
EXPOSE 8080
CMD ["python3", , "--host", "0.0.0.0", "routes.py"] 
