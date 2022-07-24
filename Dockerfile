FROM rust:latest
WORKDIR /app
RUN apt-get update && apt-get install lld clang -y
COPY . .
ENV SQLX_OFFLINE true
RUN cargo build --release
ENV APP_ENVIRONMENT production
ENTRYPOINT ["./target/release/newsletter_api"]
