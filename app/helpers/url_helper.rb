module UrlHelper
  def active_link_class(patterns, options = { class: 'active' })
    routeto = "#{controller_path}##{action_name}"
    matched = patterns.any? { |pattern| (pattern.include?('#') ? (pattern == routeto) : (pattern == controller_path)) }
    matched ? options[:class] : nil
  end
end
