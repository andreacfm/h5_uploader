require "h5_uploader/version"
require "h5_uploader/railtie" if defined?(Rails)

module Fg

  module H5Uploader

    class ActionView::Helpers::FormBuilder

      def uploader(method,*args)
        options = args.extract_options!
        options[:id] = field_id(method)
        options[:action] ||= '/public/system/'
        options[:allowedExtensions] ||= []

        jss = "var uploader = new qq.FileUploader({"
        jss = jss <<  "element: document.getElementById('#{options[:id]}'),"
        jss = jss << "allowedExtensions: #{options[:allowedExtensions].to_s}"

        options.each do |key,value| next if [:id,:allowedExtensions].include?(key)
          jss = jss << ",#{key} : '#{value}'"
        end

        jss = jss << "});"

        js_tag = @template.javascript_tag do
          jss
        end

        @template.content_tag(:div,:id => options[:id]) do
          @template.content_tag(:noscript) do
            @template.file_field @object_name,method
          end
        end  << js_tag

      end

      def field_id(label)
        "field-uploader_#{label}"
      end

    end

  end

end  

