FROM elixir:1.3

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY mix.exs /usr/src/app
RUN yes | mix local.hex
RUN mix hex.info && mix deps.get && mix deps.compile

ENTRYPOINT ["mix"]
CMD ["trot.server"]

COPY . /usr/src/app

