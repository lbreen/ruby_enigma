require 'rotor'
require 'json'

describe Rotor do

  alphabet = ('A'..'Z').to_a

  it "should be able to specify which rotor to use" do
    rotor_one = Rotor.new(rotor_number: 'i')
    rotor_two = Rotor.new(rotor_number: 'ii')

    expect(rotor_one.rotor_number).to eq("I")
    expect(rotor_two.rotor_number).to eq("II")
  end

  it "should be able to specify the start letter" do
    start_letter = alphabet.sample
    rotor = Rotor.new(rotor_number: "i", start_letter: start_letter)
    expect(rotor.start_letter).to eq(start_letter)
  end

  it "should default to 'A' if no start letter is provided" do
    rotor = Rotor.new(rotor_number: 'i')
    expect(rotor.start_letter).to eq("A")
  end

  it "should rotate with each letter entered" do
    start_letter = alphabet.sample
    next_letter = (start_letter.ord + 1).chr
    rotor = Rotor.new(rotor_number: 'i', start_letter: start_letter)

    expect(rotor.first_letter).to eq(start_letter)
    rotor.rotate!
    expect(rotor.first_letter).to eq(next_letter)
  end

  it "should substitute the letter based on its index" do

  end

  it "should rotate the next rotor, after the first rotor has completed one turn" do
    start_letter = alphabet.sample
    next_letter = (letter.ord + 1).chr
    rotor_one = Rotor.new(rotor_number: 'i', start_letter: start_letter)
    rotor_two = Rotor.new(rotor_number: 'ii', start_letter: start_letter)

    expect(rotor_two.first_letter).to eq(start_letter)

    27.times do
      rotor_one.rotate!
    end

    expect(rotor_two.first_letter).to eq(next_letter)
  end
end
