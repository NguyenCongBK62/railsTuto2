module ApplicationHelper
      def javascript_exists?(controller_name)
        File.exist?(Rails.root.join("app", "frontend", "packs", "#{controller_name}.js"))
      end
    
      def stylesheet_exists?(controller_name)
        File.exist?(Rails.root.join("app", "assets", "stylesheets", "#{controller_name}.scss"))
      end
      # Returns the full title on a per-page basis.
      def full_title(page_title = '')
        base_title = "Ruby on Rails Tutorial Sample App"
        if page_title.empty?
          base_title
        else
          page_title + " | " + base_title
        end
      end
end
