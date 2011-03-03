module ApplicationHelper

  def title
    base_title = "No name app"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
