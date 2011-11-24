module ApplicationHelper
  
  def title
    base_title = "The College Project"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def stylized_flash(key)
    case key
      when :alert
        "warning"
      when :error
        "error"
      when :notice
        "info"
      when :success
        "success"
      else
        key.to_s
    end
  end

  
end
