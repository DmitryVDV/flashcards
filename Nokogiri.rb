
  require 'rubygems'
  require 'nokogiri' 
  require 'open-uri'
  
  MAIN_URL = "http://www.languagedaily.com"
  urls_array = []

  # "<<" - push value to array
  urls_array << "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"
  links = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))
  
  # Get all Urls
  links.css("div[class=jsn-article-content]").css("li").css("a")[0..-1].each do |row|
    urls_array << (MAIN_URL + row["href"])
  end

   
 puts urls_array

  
  
  array_german_english_translation = []

  array_helper = []

urls_array[0..-1].each do |row|

  doc = Nokogiri::HTML(open(row))
  links = doc.xpath("//table/tbody/tr")
 
puts links.length

  #Каждая строка в таблице это NodeSet, прохожим во всем NodeSet и вытаскиваем нем и анг слова
  #кол-во NodeSet это links.length-1
  for i in 1..links.length-1
    
    #child_param это Nodeset тега <tr></tr> - выбираем этот Nodeset, на его уровни все теги <td>
    child_param = links.slice(i).children
    array_helper[0] = child_param.slice(3).content

     
    if (child_param.slice(5).content.length > 1) 

      array_helper[1] = child_param.slice(5).content
      array_german_english_translation[i] = array_helper

      puts array_helper[0]
      puts array_helper[1]
    end      

    array_helper = []
  end


end

  #puts a
  puts array_german_english_translation.length
  puts array_german_english_translation


  #puts c.css("li")

  #puts c.css("li")[2]['href']



