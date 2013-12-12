module ApplicationHelper
  def ham(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end

  def liquid(text, data = {})
    tpl = Liquid::Template.parse(text || "")
    tpl.render(data).html_safe
  end

  def recent_houses
    House.last(5)
  end

  def recent_posts
    Post.last(5)
  end

  def recent_travel_ideas
    TravelIdea.last(5)
  end

  def slides
    Slide.all
  end

  def render_menu(options)
    # menu = Menu.find_by(slug: options[:slug])
    # render options[:tpl], items: menu.items.roots
    render options[:tpl]
  end

  def travel_categories
    TravelCategory.all
  end
end
