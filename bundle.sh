#!/bin/sh
mkdir -p vendor/bundle
mkdir -p vendor/bin
bundle install --path=vendor/bundle --binstubs=vendor/bin
rbenv rehash
