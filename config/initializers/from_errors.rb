ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html = Nokogiri::HTML::DocumentFragment.parse(html_tag)
  element = html.children.first
  if element
    element.add_class('is-invalid')
  end
  html.to_s.html_safe
end