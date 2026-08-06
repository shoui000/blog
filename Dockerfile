FROM elixir:1.20.2-otp-29

RUN apt-get update && apt-get install -y \
	build-essential \
	npm \
	git \
	inotify-tools \
	&& rm -rf /var/lib/apt/lists/* 

RUN mix local.hex --force && \
	mix local.rebar --force 

WORKDIR /app

EXPOSE 4000

CMD ["mix", "phx.server"]
