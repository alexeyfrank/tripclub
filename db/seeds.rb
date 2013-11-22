# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# Top Menu create

top_menu = Menu.where(slug: 'top_menu').first_or_initialize
if top_menu.new_record?
  top_menu.title = 'Верхнее меню'

  top_menu.save!
end

top_menu.items.create! title: 'О нас', url: '/pages/about', position: 20
top_menu.items.create! title: 'Контакты', url: '/pages/contacts', position: 50
top_menu.items.create! title: 'Идеи для путешествий', url: '/ideas', position: 100
top_menu.items.create! title: 'Аренда квартир', url: '/houses', position: 300
top_menu.items.create! title: 'Календарь событий', url: '/events', position: 400
top_menu.items.create! title: 'Блог', url: '/blog', position: 500

# Base pages create

pages = [
  { 
    title: 'О нас',
    slug: 'about'
  },
  { 
    title: 'Контакты',
    slug: 'contacts'
  }
]

pages.each do |page|
  db_page = Page.where(slug: page[ :slug ]).first_or_initialize
  if db_page.new_record?
    db_page.title = page[ :title ]
    db_page.save
  end
end
