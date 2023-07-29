FROM python:3.11

WORKDIR /app

# 必要なシステムパッケージをインストール
RUN apt-get update && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Poetryをダウンロードしてインストール
RUN curl -sSL https://install.python-poetry.org | python -


ENV PATH /root/.local/bin:$PATH
RUN poetry config virtualenvs.create false

# アプリケーションの依存関係をインストール
COPY pyproject.toml poetry.lock /app/
RUN poetry install

COPY ./app/ .

CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8080"]