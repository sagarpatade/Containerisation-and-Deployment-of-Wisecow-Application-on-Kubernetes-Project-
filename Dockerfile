FROM ubuntu:22.04


RUN apt-get update && \
    apt-get install -y bash fortune-mod cowsay netcat-openbsd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


ENV PATH="/usr/games:$PATH"


COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

WORKDIR /app


EXPOSE 4499


ENTRYPOINT ["/app/wisecow.sh"]
