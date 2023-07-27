require "kramdown"

module IssuesHelper
  def render_markdown(text)
    Kramdown::Document.new(text).to_html.html_safe
  end
end
