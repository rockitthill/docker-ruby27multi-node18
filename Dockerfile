FROM ruby:2.7.8-slim

# Set up directory structure
RUN mkdir /app
WORKDIR /app

# Install everything
RUN apt-get update -qq \
&& apt-get install -qq --no-install-recommends build-essential curl git nano \
python2 libmariadb-dev imagemagick \
&& curl -sL https://deb.nodesource.com/setup_14.x | bash - \
&& apt-get update -qq \
&& apt-get install -qq --no-install-recommends nodejs \
&& npm install -g yarn@1.22.4 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Bundler config
RUN bundle config set --global path '/bundle'
ENV PATH="/app/bin:/bundle/ruby/2.7.8/bin:/bundle/ruby/2.7.0/bin:${PATH}"

# Ensure binding is always 0.0.0.0 to access the server outside the container
ENV BINDING="0.0.0.0"
ENV PORT="3000"
ENV EDITOR=nano

# Expose the Rails port
EXPOSE 3000
