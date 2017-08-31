require 'models/reflector'

describe "Reflector" do

  it "should substitute the character based on a given index" do
    reflector = Reflector.new
    # 'H' => 7
    # 'H' => 'K'
    # 'K' => 10
    expect(reflector.substitute(7)).to eq(10)
  end

  it "should substitute the reverse pair" do
    reflector = Reflector.new

    expect(reflector.substitute(10)).to eq(7)
  end
end
