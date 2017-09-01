require 'models/plugboard'
require 'controllers/plugboards_controller'

describe Plugboard do
  # Instantiate a new plugboard
  plugboard = Plugboard.new
  # controller = PlugboardsController.new
  new_characters = { 'D' => 'A', 'E' => 'W', 'O' => 'G' }
  alphabet = ('A'..'Z').to_a

  it 'returns the same letter, with no connections' do
    letter = alphabet.sample
    index = alphabet.find_index(letter)

    expect(plugboard.substitute(index)).to eq(index)
  end

  it 'returns different letter, with connections' do
    plugboard.update_characters(new_characters)

    new_characters.each { |key, value| expect(characters[key]).to eq(value) }
  end

  it 'can automatically set reverse characters' do
    new_characters.each { |key, value| expect(characters[value]).to eq(key) }
  end

  it 'should not be able to overwrite an existing plugboard character pair' do
    existing_connections = [{ 'D' => 'A', 'R' => 'A' }, { 'R' => 'U', 'U' => 'E' }]

    existing_connections.each do |connection|
      expect(plugboard.update_characters(connection)).to eq(false)
    end
  end
end
