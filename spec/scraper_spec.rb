describe Scraper do

  before(:all) do
    @data = Scraper.scrape("16", "A", "1501")
  end

  it 'returns info in the form of a hash' do
    expect(@data).to be_a(Hash)
  end

  it 'parses the name of an inmate correctly' do
    expect(@data["Inmate Name"]).to eq("PEREZ, HEDILBERTO")
  end

  it 'parses the crime and class correctly' do
    expect(@data["crime1"]).to eq("ATT RAPE 1ST - CLASS C")
  end

  it 'clears extra whitespace from keys' do
    expect(@data.keys.any?{|k| k =~ /\s{2,}/}).to be_falsey
  end

  it 'clears extra whitespace from values' do
    expect(@data.values.any?{|k| k =~ /\s{2,}/}).to be_falsey
  end

end
