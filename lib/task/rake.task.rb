require 'rake'
require 'fileutils'

namespace :h5_uploader do
  task :install do
    FileUtils.cp File.expand_path('../../assets/fileuploader.js',__FILE__), File.expand_path('public/javascripts/')
    puts "Copied fileuploader.js to public/javascripts"
    FileUtils.cp File.expand_path('../../assets/fileuploader.css',__FILE__), File.expand_path('public/stylesheets/')
    puts "Copied fileuploader.css to public/stylesheets"    
    puts "******Open config/application.rb and add middleware configurations. See README.md in gem folder******."
  end
end
