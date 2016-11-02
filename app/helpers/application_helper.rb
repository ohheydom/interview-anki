module ApplicationHelper
  def title(text)
    base = 'Interview Anki'
    text.empty? ? base : "#{base} | #{text}"
  end
end
