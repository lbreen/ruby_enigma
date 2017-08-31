require 'models/plugboard'

describe Plugboard do

  # Instantiate a new plugboard
  plugboard = Plugboard.new
  new_characters = { "D" => "A", "E" => "W", "O" => "G" }
  characters = plugboard.characters.to_hash

  it "returns the same letter, with no connections" do
    letters = ('A'..'Z').to_a.sample(4)

    letters.each { |letter| expect(characters[letter]).to eq(letter) }
  end

  it "returns different letter, with connections" do
    plugboard.update_characters(new_characters)

    new_characters.each { |key, value| expect(characters[key]).to eq(value) }
  end

  it "can automatically set reverse characters" do
    new_characters.each { |key, value| expect(characters[value]).to eq(key)}
  end

  it "should not be able to overwrite an existing plugboard character pair" do
    existing_connections = [{"D" => "A", "R" => "A"}, {"R" => "U", "U" => "E"}]

    existing_connections.each_with_index do |connection, index|
      expect(plugboard.update_characters(connection)).to eq(false)
    end
  end
end
