##Install
	
	gem install h5_uploader
	

##Set up
Run the install task that copy the necessary js and css resources.

	rake h5_uploader:install

In config/application.rb add the following settings:

	require "rack-raw-upload"
	
and

	config.middleware.use 'Rack::RawUpload'
	
Run bundle install.	


##js library options and docs
See [file-upload](https://github.com/jgoguen/file-uploader) 