FROM ruby:3.4.8

WORKDIR /site

COPY Gemfile Gemfile.lock* ./
RUN bundle install

RUN apt-get update -y
RUN apt-get install -y --no-install-recommends graphviz openjdk-21-jre

EXPOSE 4000
EXPOSE 35729

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--livereload", "--force_polling", "--incremental"]
