class Rotor
  def initialize(attr = {})
    @character_set = attr[:character_set]
    @start_letter = attr[:start_letter].upcase || 'A'
    set_starting_letter
  end

  def set_starting_letter
    @character_set.rotate! until @character_set[0][0] == @start_letter
  end

  def substitute
    # Substitute each letter
  end
end
