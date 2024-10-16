FROM debian:latest
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl dropbear wget neofetch
RUN curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && \
    apt-get update && \
    apt-get install -y ngrok
EXPOSE 2222
CMD dropbear -p 2222 & \
    ngrok config add-authtoken 1tWuxGnjCPn0XalIWNsbjRlkS9G_ZTJGn3Fbhswygtv8JqTR && \
    ngrok tcp 2222 && \
    /bin/bash
