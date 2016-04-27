module ApplicationHelper
  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end
