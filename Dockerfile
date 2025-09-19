FROM ubuntu:22.04

# Update apt and install required packages including netcat-openbsd
RUN apt-get update && \
    apt-get install -y bash fortune-mod cowsay netcat-openbsd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH for fortune and cowsay
ENV PATH="/usr/games:$PATH"

# Copy wisecow script and make it executable
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

WORKDIR /app

# Expose port 4499
EXPOSE 4499

# Run the wisecow script on container start
ENTRYPOINT ["/app/wisecow.sh"]
