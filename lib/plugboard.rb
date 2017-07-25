class Plugboard
  attr_reader :connections

  def initialize(connections)
    @connections = connections
  end

  def update_connections(settings)
    # Return false if the connections are invalid
    return false unless valid?(settings)

    settings.each do |key, value|
      @connections[key] = value
      @connections[value] = key
    end
  end

  def substitute(letter)
    @connections[letter]
  end

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
