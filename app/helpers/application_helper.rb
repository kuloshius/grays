module ApplicationHelper

  def title
    base_title = app_name
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  def app_name
    "SLP"
  end

end
