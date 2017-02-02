# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  a = []
  b = []
  doc = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))
  links = doc.xpath("//table/tbody/tr")
  
  for i in 1..links.length-1
    c = links.slice(i).children
    b[0] = c.slice(3).content
    b[1] = c.slice(5).content
    a[i] = b
    b = []
  end

  a.each do |s,c|
    Card.create(original_text: s.to_s, translated_text: c.to_s)
  end
