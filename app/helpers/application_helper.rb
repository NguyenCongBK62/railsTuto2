module ApplicationHelper
      def javascript_exists?(controller_name)
        File.exist?(Rails.root.join("app", "frontend", "packs", "#{controller_name}.js"))
      end
    
      def stylesheet_exists?(controller_name)
        File.exist?(Rails.root.join("app", "assets", "stylesheets", "#{controller_name}.scss"))
      end
end
