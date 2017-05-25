require 'net/http'
require 'uri'
require 'resolv-replace'

class DINSubmitter

  URL = "http://nysdoccslookup.doccs.ny.gov/GCA00P00/WIQ1/WINQ000"

  # using the three parts of a DIN number, submit a POST request
  # and receive a response containing all the details about an inmate.
  # return the response body to be used by Nokogiri for parsing.
  def self.get_data(fld1, fld2, fld3)

    http = Curl.post(URL, {
      K01: "WINQ000",
      M00_DIN_FLD1I: "#{fld1}",
      M00_DIN_FLD2I: "#{fld2}",
      M00_DIN_FLD3I: "#{fld3}"
    }) do |http|
      http.headers["Content-Type"] = "application/x-www-form-encoded"
    end

    http.body_str
  end

end
