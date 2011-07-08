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

##Custom options
Added a custom  option  *evalResponse*  default to true. This is useful when Rails resturn a js to be evaluated and not to be converted into json. If option is true
a valid reponsed for the uploader is soemthing like this:

	(function(){
	    
		// your callback code here
	
		return {success:true};
	})();