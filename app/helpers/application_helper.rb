module ApplicationHelper
  
  # def page_title(separator = ' - ')
    # [content_for(:title), 'CulturARt'].compact.join(separator)
  # end

  # def page_heading(title)
    # content_for(:title){ title }
    # content_tag(:h1, title)
  # end
  

  def page_title(title)
    content_for(:page_title) { title }
  end
  
  def page_heading(title, subtitle = '')
    content_for(:page_title){ title }
    content_tag(:h1, link_to(content_tag(:i, '', class: "icon-arrow-left-3 fg-darker smaller"), :back)+title+content_tag(:small, subtitle, class: "on-right"))
  end

end
