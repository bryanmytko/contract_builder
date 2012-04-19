module ApplicationHelper

    def title
        base_title = "Blue Fountain Media Contract Builder"
        if @title.nil?
          base_title
        else
          "#{base_title} | #{@title}"
        end
    end
    
    def flash_helper
      
      f_names = [:notice, :warning, :message]
      fl = ''

      for name in f_names
          if flash[name]
              fl = fl + flash[name]
          end
          flash[name] = nil;
      end
      
      if fl != ''
        content_tag("div", fl, :id => "flash")
      end
      
  end
  
end
