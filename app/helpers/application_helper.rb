module ApplicationHelper
  def full_title(page_title = "")
    base_title = "100Days Of Training"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def current_user?(user)
    user == current_user
  end
end
