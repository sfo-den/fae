#!/usr/bin/env bash
# exit on error
set -o errexit

ls -la
cd spec/dummy
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate