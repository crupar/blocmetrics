module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: css_class
  end


  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
end
