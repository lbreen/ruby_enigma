class Plugboard
  attr_reader :keys

  def initialize(keys)
    @keys = keys
  end

  def update_keys(settings)
    settings.split(', ').each do |key_pair|
      @keys[key_pair.chars[0]] = key_pair.chars[1]
      @keys[key_pair.chars[1]] = key_pair.chars[0]
    end
  end

  def substitute!(letter)
    @keys[letter]
  end
end
