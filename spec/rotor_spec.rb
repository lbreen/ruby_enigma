require 'models/rotor'

describe Rotor do

  alphabet = ('A'..'Z').to_a

  it "should be able to specify which rotor to use" do
    rotor_one = Rotor.new(rotor_number: 'I')
    rotor_two = Rotor.new(rotor_number: 'II')

    expect(rotor_one.rotor_number).to eq('I')
    expect(rotor_two.rotor_number).to eq('II')
  end

  it "should be able to specify the start letter" do
    start_letter = alphabet.sample
    rotor = Rotor.new(rotor_number: 'I', start_letter: start_letter)
    expect(rotor.first_letter).to eq(start_letter)
  end

  it "should default to 'A' if no start letter is provided" do
    rotor = Rotor.new(rotor_number: 'I')
    expect(rotor.first_letter).to eq("A")
  end

  it "should substitute the letter based on its index" do
    # character = 'E'
    # character_index = 4

    rotor = Rotor.new(rotor_number: 'I', start_letter: 'K')
    rotor.rotate!
    expect(rotor.substitute(4)).to eq(11)
  end

  it "should substitute the letter in reverse" do
    rotor = Rotor.new(rotor_number: 'I', start_letter: 'K')
    rotor.rotate!
    expect(rotor.substitute(11)).to eq (4)
  end

  # it "should rotate before every substitution" do
  #   start_letter = alphabet.sample
  #   if start_letter == 'Z'
  #     next_letter = 'A'
  #   else
  #     next_letter = (start_letter.ord + 1).chr
  #   end

  #   rotor = Rotor.new(rotor_number: 'I', start_letter: start_letter)

  #   expect(rotor.first_letter).to eq(start_letter)
  #   rotor.substitute(4)
  #   expect(rotor.first_letter).to eq(next_letter)
  # end
end
