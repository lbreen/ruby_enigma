class Rotor
  attr_reader :start_letter, :rotor_number, :first_letter

  def initialize(attr = {})
    @rotor_number = attr[:rotor_number].upcase
    @characters = get_key_settings(@rotor_number)
    @start_letter = (attr[:start_letter] || 'A').upcase
    set_start_letter # Rotate the @characters array until @characters.first == start_letter
    @first_letter = @start_letter
  end

  def substitute(index)
    rotate!
    @characters.find_index(@characters[index].rotate)
  end

  private

  def rotate!
    # Rotate the @characters array and update the @first_letter
    @characters.rotate!
    @first_letter = @characters.first[0]
  end

  def get_key_settings(rotor_number)
    open_json["rotor_#{rotor_number.downcase}"]
  end

  def open_json
    JSON.parse(File.read('lib/key_settings.json'))
  end

  def set_start_letter
    @characters.rotate! until @characters.first[0] == @start_letter
  end
end

# The Rotors form the basis of the enigma machine's cryptographic ability. Each
# rotor performs two letter substitutions during the lifecycle of a single
# character - once on the "way out" and once on the "way back".
#
# Inside each rotor is a pre-determined, reversible connection. For example, an
# input of 'P' will always result in an output of 'W', if using Rotor I. Whereas
# an inout of 'P', for Rotor II, will result in an output of 'G'. The reversible
# nature of the rotors mean that an input of 'W' and 'G', for Rotor I and II
# respectively, will result in an output of 'P'. It is this reversible attribute
# which means, when the user starts with the same settings used to encrypt the
# message can input the cyphertext and retrieve the plaintext.
#
# In a physical engima, the letter substitution is carried out by a series of
# electrical signals. In order to replicate this behaviour, it is important to
# record the letter's index in the character array.
#
# PROCESS
#
# First, the Rotor model must initialize by retrieving the rotor_number and
# start_letter from the user.
#
# Next, the Rotor can retrieve the correct character array from key_settings.json
# and rotate until the start_letter is the first character in the array.
#
# Then, when a character is entered into the enigma machine the substitute method
# will be called, which will rotate the character array and substitute the input
# character based on its character array index.
#
# EXAMPLE - Rotor I key settings
#
# If the starting letter is 'K' and the input character is 'E', then the
# input character index is equal to 4. This is because 'E' is the fifth letter
# in the normal alphabet, but indexes start at 0 (A => 0, B => 1, C => 2, D => 3,
# E => 5). The first event caused by the input character ('E') is to rotate
# the Rotor, so the new start letter is 'L'. Then using the character_index, we
# retrieve the character pair 4 letters from 'L', which is 'P' (L => 0, M => 1,
# N => 2, O => 3, P => 4). In Rotor I, the letter 'P' has a pre-determined
# connection with 'W' which, in an alphabet starting at 'L', has an index of 11.
# Therefore, the letter 'W' and its index of 11 are passed on to the next Rotor
# to begin the next substition.
#
# Initialize
#     rotor_number = 'I' ### Use Rotor I key settings
#     start_letter = 'K' ### Alphabet starts at 'K' [K, L, M, N, O, P,...]
#
# Input from previous substitution (either plugboard or previous rotor)
#     input_character = 'E'
#     input_index = 4
#
# Rotor rotates
#     previous_start_letter = 'K'
#     new_start_letter = 'L' ### Alphabet now starts at 'L' [L, M, N, O, P,...]
#
# Substitute with the character at the input_index
#     alphabet = [L, M, N, O, P,...]
#     input_index = 4
#     letter_at_input_index = 'P'
#
# Substitute letter_at_input_index with its character pair
#     letter_at_input_index = 'P'
#     character_pair = 'W'
#     character_pair_index = 11 ### In an alphabet starting at 'L'
#
# Output
#   output_character = 'W'
#   output_index = 11
