class Plugboard
  attr_reader :connections

  def initialize(connections)
    @connections = connections
  end

  def update_connections(settings)
    # settings.split(', ').each do |key_pair|
    #   @connections[key_pair.chars[0]] = key_pair.chars[1]
    #   @connections[key_pair.chars[1]] = key_pair.chars[0]
    # end
  end

  def substitute!(letter)
    @connections[letter]
  end
end
