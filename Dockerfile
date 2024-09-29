FROM python:3.9.7
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
ENV DATABASE_HOSTNAME=mon_postgres2 \
    DATABASE_PORT=5432 \ 
    DATABASE_PASSWORD=postgres \ 
    DATABASE_NAME=fastapi \ 
    DATABASE_USERNAME=postgres \
    SECRET_KEY=09d25e094faa2556c818166b7a99f6f0f4c3b88e8d3e7 \
    ALGORITHM=HS256 \
    ACCESS_TOKEN_EXPIRE_MINUTES=300
COPY . .
COPY entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]