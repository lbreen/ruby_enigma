require_relative 'view'
class Controller
  def initialize(attr = {})
    @plugboard = attr['plugboard']
    @view = View.new
    build_plugboard
  end

  def start
    message = @view.request_message

    substituted_letters = message.gsub(' ', '').chars.map { |letter| @plugboard.substitute!(letter) }

    @view.display_message(substituted_letters.join)
  end

  private

  def build_settings
    key_settings = @view.request_new_key_settings('plugboard')

    @plugboard.keys(key_settings)
  end
end
