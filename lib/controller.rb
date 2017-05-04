require_relative 'view'

class Controller
  def initialize(attr = {})
    @plugboard = attr['plugboard']
    @view = View.new
    set_plugboard
  end

  def start
    message = @view.request_message

    substituted_letters = message.gsub(" ", "").chars.map { |letter| @plugboard.substitute!(letter) }

    @view.display_message(substituted_letters.join)
  end

  private

  def set_plugboard
    key_settings = @view.request_new_key_settings("plugboard")

    @plugboard.set_keys(key_settings)
  end
end
