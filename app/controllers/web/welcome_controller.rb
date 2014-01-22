class Web::WelcomeController < Web::ApplicationController

  def index
    @page = Page.find_by! slug: :main
    @slides = slides
    @content = liquid @page.content, main_page_helpers
  end

  def main_page_helpers
    {
      'recent_posts'  => recent_posts.map   { |p| { 'id' => p.id, 'title' => p.title } },
      'recent_houses' => recent_houses.map  { |p| { 'id' => p.id, 'address' => p.address } },
      'slides'        => slides.map         { |s| { 'image_url' => s.image_url } }
    }
  end
end
