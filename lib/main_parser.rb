class MainParser

  def self.parse(file)
    dins = CSVParser.parse(file)

    final_info = []

    dins.each do |din|
      final_info << Scraper.scrape(din[0], din[1], din[2])
    end

    final_info
  end

end
