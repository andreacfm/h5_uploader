require 'rails'
module Fg
  module H5Uploader
    class Railtie < Rails::Railtie
      rake_tasks do
        require_relative '../task/rake.task'
      end
    end
  end
end
