# https://hub.docker.com/_/ruby
FROM ruby:3.3

# This command updates the RubyGems system, which is the package manager for Ruby.
# It ensures that you have the latest version of RubyGems, which can include important
# updates and security fixes.
RUN gem update --system

# Install requirements for the app based on the Gemfile
RUN bundle install


