class CSVParser

  # scan the csv with regex
  # turn each DIN into an array of three parts: ["15", "A", "2000"]
  # the return value should be an array of arrays for every DIN
  def self.parse(csv)
    result = []

    raw_dins = csv.scan(/\d{2}[\s\-\_]?[A-Za-z]{1}[\s\-\_]?\d{4}/).map do |d|
      d.gsub(/[^A-Za-z0-9]/, '')
    end

    re = Regexp.union(
      /\d{2}(?=[A-Za-z])/,
      /(?<=\d{2})[A-Za-z]{1}/,
      /(?<=[A-Za-z])\d{4}/
    )

    raw_dins.each{|din| result << din.scan(re)}

    result
  end

end
