require 'plugboard'
require 'json'

describe Plugboard do
  # Retrieve inital key settings
  key_settings = JSON.parse(File.read('lib/key_settings.json'))

  # Instantiate a new plugboard
  plugboard = Plugboard.new(key_settings['plugboard'])
  new_connections = { "D" => "A", "E" => "w", "O" => "G" }
  connections = plugboard.connections.to_hash

  it "returns the same letter, with no connections" do
    letters = ('A'..'Z').to_a.sample(4)

    letters.each { |letter| expect(connections[letter]).to eq(letter) }
  end

  it "returns different letter, with connections" do
    plugboard.update_connections(new_connections)

    new_connections.each { |key, value| expect(connections[key]).to eq(value) }
  end

  it "can automatically set reverse connections" do
    new_connections.each { |key, value| expect(connections[value]).to eq(key)}
  end

  it "should not be able to overwrite an existing plugboard connection" do
    new_connections = {"D" => "A", "A" => "E"}

    expect(plugboard.update_connections(new_connections)).to eq(false)
  end
end
