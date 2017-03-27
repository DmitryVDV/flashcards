# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  MAIN_URL = "http://www.languagedaily.com"
  urls_array = []
  array_helper = []

  # "<<" - push value to array
  urls_array << "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"
  links = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))
  
  # Get all Urls
  links.css("div[class=jsn-article-content]").css("li").css("a")[0..-1].each do |row|
    urls_array << (MAIN_URL + row["href"])
  end

  urls_array[0..-1].each do |row|

    doc = Nokogiri::HTML(open(row))
    links = doc.xpath("//table/tbody/tr")
    #Каждая строка в таблице это NodeSet, прохожим во всем NodeSet и вытаскиваем нем и анг слова
    #кол-во NodeSet это links.length-1
    for i in 1..links.length-1
    
      #child_param это Nodeset тега <tr></tr> - выбираем этот Nodeset, на его уровни все теги <td>
      child_param = links.slice(i).children
      array_helper[0] = child_param.slice(3).content

      if (child_param.slice(5).content.length > 1) 

        array_helper[1] = child_param.slice(5).content
        Card.create(original_text: array_helper[0].to_s, translated_text: array_helper[1].to_s)
        
      end
    end
  end
  

