require "h5_uploader/version"
require "h5_uploader/railtie" if defined?(Rails)

module Fg

  module H5Uploader

    def uploader_js_content name,options
      jss = "var uploader_#{options[:id]} = new qq.FileUploader({"
      jss = jss <<  "element: document.getElementById('#{options[:id]}'),"
      jss = jss << "allowedExtensions: #{options[:allowedExtensions].to_s}"
      jss = jss << ",params: #{options[:params].to_json}" unless options[:params].nil?  

      options.each do |key,value| next if [:id,:allowedExtensions,:params].include?(key)
        val = (key =~ /[^(on|show|mess)]/) > 0 ? "#{value}" : "'#{value}'" 
        jss = jss << ",#{key}: #{val}"
      end

      jss = jss << "});"            

    end

    def uploader_field_id(label)
      "field_uploader_#{label}"
    end
    
    def parse_uploader_options options,name
      options[:id] = uploader_field_id(name)
      options[:action] ||= '/public/system/'
      options[:allowedExtensions] ||= []
      options[:params] ||= {}
    end  

  end

end

module ActionView

  module Helpers

    class FormBuilder
      
      include Fg::H5Uploader 
        
      def uploader(method,*args)
        options = args.extract_options!
        parse_uploader_options options,method
        
        js_tag = @template.javascript_tag do
          uploader_js_content method,options
        end

        @template.content_tag(:div,:id => options[:id]) do
          @template.content_tag(:noscript) do
            @template.file_field @object_name,method
          end
        end  << js_tag

      end

    end

    module FormTagHelper
      
      include Fg::H5Uploader

      def uploader_field_tag(name, *args)
        options = args.extract_options!
        parse_uploader_options options,name
        
        js_tag = javascript_tag(uploader_js_content(name,options))
        div_tag = content_tag(:div,content_tag(:noscript,file_field_tag(name)),:id => options[:id])
        div_tag << js_tag

      end

    end

  end

end  


