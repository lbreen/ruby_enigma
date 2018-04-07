require_relative 'controllers/plugboards_controller'
require_relative 'models/plugboard'
require_relative 'views/view'

puts 'Starting...'
plugboard = Plugboard.new
plugboards_controller = PlugboardsController.new(plugboard)
view = View.new

### Pseudo-code ###
# 1. Enter plugboard settings
plugboards_controller.edit
p plugboard.characters
# 2. Enter rotor settings
#     1. Rotor numbers (1 - 7)
#     2. Start letters
# 3. Enter message
plaintext_characters = view.request_message.split('')
# 4. Plugboard substitution
plaintext_characters = plugboards_controller.substitute(plaintext_characters)
p plaintext_characters
# 5. Rotor three substitution
# 6. Rotor two substitution
# 7. Rotor one substitution
# 8. Reflector substitution
# 9. Rotor one substitution
# 10. Rotor two substitution
# 11. Rotor three substitution
# 12. Plugboard substitution
# 13. Display message

puts 'Finished!'
