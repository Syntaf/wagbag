FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem update --system && gem install bundler -v 2.0.1
WORKDIR /opt/wagbag

COPY Gemfile /opt/wagbag
COPY Gemfile.lock /opt/wagbag
RUN bundle install
COPY . /opt/wagbag

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]