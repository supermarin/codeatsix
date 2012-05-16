module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(text).html_safe
  end

end

class ActiveSupport::TimeWithZone
  def as_json(options = {})
    strftime('%Y-%m-%d %H:%M:%S %z')
  end
end
