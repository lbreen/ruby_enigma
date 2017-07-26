require 'rotor'
require 'json'

describe Rotor do
  # Retrieve inital key settings
  key_settings = JSON.parse(File.read('lib/key_settings.json'))

  it "should be able to specify the start letter" do
    start_letter = 'C'
    rotor = Rotor.new(settings: key_settings['rotor_i'], start_letter: start_letter)
    expect(rotor.start_letter).to eq("C")
  end

  it "should default to 'A' if no start letter is provided" do
    rotor = Rotor.new(key_settings['rotor_i'])
    expect(rotor.start_letter).to eq("A")
  end

  it "should be able to specify which rotor to use" do
    rotor_one = Rotor.new(key_settings['rotor_i'])
    rotor_two = Rotor.new(key_settings['rotor_ii'])

    expect(rotor_one.rotor_number).to eq("I")
    expect(rotor_two.rotor_number).to eq("II")
  end

  it "should rotate with each letter entered" do
    rotor = Rotor.new(settings: key_settings['rotor_i'])

    expect(rotor.first_letter).to eq("A")
    # Substitue
    expect(rotor.first_letter).to eq("B")
  end

  it "should return the same output letter for the same input letter" do
    rotor = Rotor.new(settings: key_settings['rotor_i'])

    rotor.substi

  end
end
