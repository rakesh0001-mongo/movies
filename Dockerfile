FROM python:3.12-slim

WORKDIR /app
COPY . /app/

# Git aur dependencies install karo
RUN apt-get update && apt-get install -y git \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
CMD ["python", "bot.py"]
