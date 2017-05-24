class Scraper

  # take a processed and split-up DIN as three fields,
  # run the POST request with DINSubmitter,
  # return a hash with inmate info
  def self.scrape(fld1, fld2, fld3)
    html = Nokogiri::HTML(DINSubmitter.get_data(fld1, fld2, fld3))
    info = Hash.new

    # scrape the first table
    ('t1a'..'t1l').to_a.each do |key|
      info[html.at("\##{key}").text.clean_up] =
        html.at("td[headers=\"#{key}\"]").text.clean_up
    end

    # scrape crime info
    # {
    #   "crime1" => "ATT RAPE - CLASS C",
    #   "crime2" => "... - CLASS A",
    # }
    crime_names = html.css("td[headers='crime']")
                      .text
                      .split("\r\n")
                      .map(&:clean_up)
                      .reject(&:blank?)

    crime_classes = html.css("td[headers='class']")
                        .text
                        .split(/\s+/)
                        .map(&:clean_up)
                        .reject(&:blank?)

    crimes = crime_names.zip(crime_classes).map do |a|
      a.join(" - CLASS ")
    end

    crimes.each_with_index do |c, i|
      info["crime#{i+1}"] = c
    end

    # scrape the third table
    ('t3a'..'t3l').to_a.each do |key|
      info[html.at("\##{key}").text.clean_up] =
        html.at("td[headers=\"#{key}\"]").text.clean_up
    end

    info
  end
end

class String
  def clean_up
    self.gsub("\u00A0", '').gsub(/\r\n\s+/, ' ').strip
  end
end
