require "h5_uploader/version"
require "h5_uploader/railtie" if defined?(Rails)

module Fg

  module H5Uploader

    def uploader_js_content name,options
      options[:id] = uploader_field_id(name)
      options[:action] ||= '/public/system/'
      options[:allowedExtensions] ||= []

      jss = "var uploader = new qq.FileUploader({"
      jss = jss <<  "element: document.getElementById('#{options[:id]}'),"
      jss = jss << "allowedExtensions: #{options[:allowedExtensions].to_s}"

      options.each do |key,value| next if [:id,:allowedExtensions].include?(key)
        jss = jss << ",#{key} : '#{value}'"
      end

      jss = jss << "});"            

    end

    def uploader_field_id(label)
      "field-uploader_#{label}"
    end

  end

end

module ActionView

  module Helpers

    class FormBuilder
      
      include Fg::H5Uploader 
        
      def uploader(method,*args)

        js_tag = @template.javascript_tag do
          uploader_js_content method,args.extract_options!
        end

        @template.content_tag(:div,:id => options[:id]) do
          @template.content_tag(:noscript) do
            @template.file_field @object_name,method
          end
        end  << js_tag

      end

    end

    module FormTagHelper

      def uploader_field_tag(name, *args)

        js_tag = javascript_tag(uploader_js_content(name,args.extract_options!))
        div_tag = content_tag(:div,content_tag(:noscript,file_field_tag(name)),:id => options[:id])
        div_tag << js_tag

      end

    end

  end

end  


