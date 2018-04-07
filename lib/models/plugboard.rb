require_relative 'component'

class Plugboard < Component
  attr_accessor :characters

  def initialize
    @characters = open_json['plugboard'] # open_json is inherited from Component class
  end
end
