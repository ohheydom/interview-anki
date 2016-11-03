module ApplicationHelper
  def full_title(text)
    base = 'Interview Anki'
    text.empty? ? base : "#{base} | #{text}"
  end
end
