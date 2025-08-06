FROM python:3.12-slim

# Working directory set karo
WORKDIR /app

# Pehle system dependencies install karo
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    g++ \
    make \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev \
    libwebp-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app/

# Python dependencies install karo
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Port expose karo
EXPOSE 8080

# Bot run karne ka command
CMD ["python", "bot.py"]
