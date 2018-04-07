require 'models/plugboard'
require 'controllers/plugboards_controller'

describe Plugboard do
  # Instantiate a new plugboard
  plugboard = Plugboard.new
  controller = PlugboardsController.new(plugboard)
  characters = plugboard.characters
  new_characters = [['D', 'A'], ['E', 'W'], ['O', 'G']]
  alphabet = ('A'..'Z').to_a

  it 'returns the same letter, with no connections' do
    letter = alphabet.sample

    expect(plugboard.characters[letter]).to eq(letter)
  end

  it 'returns different letter, with connections' do
    controller.update(new_characters)
    new_characters.each do |char|
      expect(plugboard.characters[char[0]]).to eq(char[1])
    end
  end

  it 'can automatically set reverse characters' do
    new_characters.each { |char| expect(characters[char[1]]).to eq(char[0]) }
  end

  it 'should not be able to overwrite an existing plugboard character pair' do
    existing_connections = [{ 'D' => 'A', 'R' => 'A' }, { 'R' => 'U', 'U' => 'E' }]

    existing_connections.each do |connection|
      expect(controller.update(connection)).to eq(false)
    end
  end
end
