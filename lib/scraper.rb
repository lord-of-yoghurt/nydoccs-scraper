class Scraper

  # take a processed and split-up DIN as three fields,
  # run the POST request with DINSubmitter,
  # return a hash with inmate info
  def self.scrape(fld1, fld2, fld3)
    html = Nokogiri::HTML(DINSubmitter.get_data(fld1, fld2, fld3))
    # REGEX TO USE LATER FOR PARSING CSV: /\d{2}[\s\-\_]?[A-Za-z]{1}[\s\-\_]?\d{4}/

    # key: html.at("#t1b").text.strip

    # value: html.at("td[headers='t1b']").text.gsub("\u00A0", '').strip
    # t1a..t1l for first table

    # second table headers: crime, class

    # third table headers: t3a..t3l

    keys = []
    values = []

    ('t1a'..'t1l').to_a.each do |key|
      keys << html.at("\##{key}").text.gsub("\u00A0", '').strip
      values << html.at("td[headers=\"#{key}\"]").text.gsub("\u00A0", '').strip
    end

    inmate_info = Hash[keys.zip(values)]
    inmate_info
  end
end
