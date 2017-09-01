require_relative 'component'

class Plugboard < Component
  attr_reader :characters

  def initialize
    @characters = open_json['plugboard'] # open_json is inherited from Component class
  end

  # Substitute method is inherited from Component class
end
