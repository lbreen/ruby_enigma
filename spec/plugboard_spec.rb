require 'plugboard'
require 'json'

describe Plugboard do
  # Retrieve inital key settings
  key_settings = JSON.parse(File.read('lib/key_settings.json'))

  # Instantiate a new plugboard
  plugboard = Plugboard.new(key_settings['plugboard'])

  new_connections = {
    "D" => "A",
    "E" => "w",
    "O" => "G"
  }

  connections = plugboard.connections.to_hash

  it "returns the same letter, with no connections" do


    letters = ('A'..'Z').to_a.sample(4)

    letters.each { |letter| expect(connections[letter]).to eq(letter) }
  end

  it "can set plugboard connections" do
    plugboard.update_connections(new_connections)

    new_connections.each { |key, value| expect(connections[key]).to eq(value) }
  end

  it "can automatically set reverse connections" do
    new_connections.each { |key, value| expect(connections[value]).to eq(key)}
  end
end

# require "restaurant"

# describe Restaurant do

#   let(:jules_verne) { Restaurant.new("paris", "Jules Verne") }
#   let(:tour_d_argent) { Restaurant.new("paris", "Tour d'argent") }
#   let(:bocuse) { Restaurant.new("lyon", "Paul Bocuse") }
#   let(:restos) { [jules_verne, tour_d_argent, bocuse] }

#   describe "#average_rating" do
#     it "should implement #average_rating reader" do
#       expect(jules_verne).to respond_to :average_rating
#     end
#   end

#   describe "#rate" do
#     it "should update average restaurant rating" do
#       bocuse.rate(10)
#       bocuse.rate(20)
#       expect(bocuse.average_rating).to eq 15.0
#     end
#   end

#   describe "#filter_by_city" do
#     it "should respond to filter_by_city method" do
#       expect(Restaurant).to respond_to :filter_by_city
#     end
#     it "should filter by city existing restaurants" do
#       expect(Restaurant.filter_by_city(restos,"lyon")).to eq [bocuse]
#     end
#   end

# end
