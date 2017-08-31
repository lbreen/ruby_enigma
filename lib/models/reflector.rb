require_relative 'component'

class Reflector < Component
  def initialize
    @characters = open_json['reflector']
  end

  # Substitute method is inherited from Component class
  # open_json method is inherited from Component class
end

# In a physical engima machine, once the electrical signal has passed through
# the plugboard and three rotors (performing a letter substition at each stage),
# it reaches the reflector. This component performs a further fixed letter
# substitution in the same manner as the rotors. However, unlike the rotors, the
# reflector never rotates meaning the first character is always 'A'. The
# reflector is the key component which allows the engima machine to both encrypt
# and decrypt a message, if beginning with the same key settings.
#
# PROCESS
#
# Firstly, retrieve the key settings from key_settings.json.
#
# Then, use the input_index to retrieve the character pair and reverse this pair
# in order to perform the substitution.
#
# Finally, find the index of the reversed character pair
#
# EXAMPLE
#
# Initialize
#     Retrieve key settings and assign to the @characters array
#
# Incoming data from previous rotor
#     input_index = 7
#
# Find character pair at this index
#     @characters[input_index] => ['H', 'K'] ### 'H' is the 7th letter in the
#                                               alphabet when starting at an
#                                               index of 0 ('A' => 0, 'B' => 1,
#                                               'C' => 3,... 'H' => 7).
#
#  Reverse character pair to simulate letter substitution
#     @characters[input_index].rotate => ['K', 'H']
#
#  Find index of new character ('K')
#     @characters.find_index(['K', 'H']) => 10 ### Same as above, 'K' is the
#                                                   10th letter in the alphabet.
