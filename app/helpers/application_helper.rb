module ApplicationHelper
  def truncate_description(description, length = 250)
    truncate(description, length: length, separator: ' ')
  end
end
