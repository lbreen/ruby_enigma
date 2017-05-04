require_relative 'view'

class Controller
  def initialize(attr = {})
    @plugboard = attr['plugboard']
    @view = View.new
    update_plugboard_key_settings
  end

  def start
    message = @view.request_message

    substituted_letters = message.gsub(" ", "").chars.map { |letter| plugboard_substitution!(letter) }

    @view.display_message(substituted_letters.join)
  end

  private

  def plugboard_substitution!(letter)
    letter = @plugboard.keys[letter]
  end

  def update_plugboard_key_settings
    input = @view.request_new_key_settings("plugboard")

    input.split(", ").each do |key_pair|
      @plugboard.keys[key_pair.chars[0]] = key_pair.chars[1]
      @plugboard.keys[key_pair.chars[1]] = key_pair.chars[0]
    end

    p @plugboard.keys
  end
end
