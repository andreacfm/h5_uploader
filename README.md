Set up
====

config/application.rb
----

Add requre after the rails require statement

__require "rack-raw-upload"__

Add the middleware config

__config.middleware.use 'Rack::RawUpload'__

