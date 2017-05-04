class Plugboard

  def initialize(keys)
    @keys = keys
  end

  def set_keys(settings)
    settings.split(", ").each do |key_pair|
      @keys[key_pair.chars[0]] = key_pair.chars[1]
      @keys[key_pair.chars[1]] = key_pair.chars[0]
    end
  end

  def substitute!(letter)
    @keys[letter]
  end
end
