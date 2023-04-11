FROM python:3.10.6-alpine
WORKDIR /code

RUN apk --update --upgrade add --no-cache  gcc musl-dev jpeg-dev zlib-dev libffi-dev cairo-dev pango-dev gdk-pixbuf-dev

RUN python -m pip install --upgrade pip
COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
RUN pip install tensorflow 
RUN pip install keras 
RUN pip install nltk 
RUN pip install flask 

EXPOSE 7007
COPY . .
CMD [ "python3", "app.py" ]