module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def nav_link(link_text, link_path, options={})
    class_name = current_page?(link_path) ? 'active' : ''
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path, options
    end
  end
end
