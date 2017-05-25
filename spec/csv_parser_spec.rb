describe CSVParser do

  before(:all) do
    @data = CSVParser.parse(File.open('./fixtures/example_csv.csv').read)
  end

  it 'returns an array of DINs' do
    expect(@data).to be_a(Array)
  end

  it 'parses each DIN as a nested array with three parts' do
    expect(@data[0]).to eq(["15", "A", "2000"])
  end

end
