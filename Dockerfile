FROM ruby:3.0.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /Proyecto_Final_SO
COPY . /
RUN ls -la /
RUN gem install bundler
RUN gem install rails 
RUN bundle install

# Add a script to be executed every time the container starts.
#COPY /Proyecto_Final_SO/entrypoint.sh /usr/bin/
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "webpacker:install"]
CMD ["rails", "db:migrate RAILS_ENV=development"]
CMD ["rails", "server", "-b", "0.0.0.0"]