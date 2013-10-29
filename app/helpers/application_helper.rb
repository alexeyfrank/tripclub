module ApplicationHelper
  def ham(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end

  def render_menu(options)
    menu = Menu.find_by(slug: options[:slug])
    render options[:tpl], items: menu.items.roots
  end
end
