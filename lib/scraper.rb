class Scraper
  def self.scrape
    html = Nokogiri::HTML(DINSubmitter.get_data("16", "A", "1501"))

    # name: html.at("td[headers='t1b']").text.gsub("\u00A0", '').strip
    # t1b..t1l for first table

    # second table headers: crime, class

    # third table headers: t3a..t3l
  end
end
