require_relative 'component'

class Plugboard < Component
  attr_reader :characters

  def initialize
    @characters = open_json['plugboard'] # open_json is inherited from Component class
  end

  def update_characters(settings)
    # Return false if the character pairs are invalid
    return false unless valid?(settings)

    settings.each do |key, value|
      @characters[key] = value
      @characters[value] = key
    end
  end

  # Substitute class is inherited from Component class

  private

  def valid?(settings)
    keys = settings.map { |key, _value| key }
    values = settings.map { |_key, value| value }
    keys_and_values = keys + values
    return false if keys.count != keys.uniq.count # Are any keys duplicated?
    return false if values.count != values.uniq.count # Are any keys duplicated?
    return false if keys_and_values.count != keys_and_values.uniq.count # Are any keys also values, and visa versa?
    true # If none of the above, return true
  end
end
