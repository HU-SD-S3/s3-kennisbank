FROM ruby:3.4.8

WORKDIR /site

RUN apt-get update -y
RUN apt-get install -y --no-install-recommends graphviz openjdk-21-jre plantuml

COPY Gemfile Gemfile.lock* ./
RUN bundle install

EXPOSE 4000
EXPOSE 35729

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--livereload", "--force_polling", "--incremental"]
