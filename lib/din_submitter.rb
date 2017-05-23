require 'net/http'
require 'uri'

class DINSubmitter

  URL = "http://nysdoccslookup.doccs.ny.gov/GCA00P00/WIQ1/WINQ000"

  def self.get_data(fld1, fld2, fld3)
    uri = URI.parse(URL)

    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new(uri.request_uri, initheader = {
      "Content-Type" => "application/x-www-form-encoded"
    })

    request.set_form_data({
      "K01" => "WINQ000",
      "M00_DIN_FLD1I" => "#{fld1}",
      "M00_DIN_FLD2I" => "#{fld2}",
      "M00_DIN_FLD3I" => "#{fld3}"
    })

    response = http.request(request)
    response.body
  end

end
