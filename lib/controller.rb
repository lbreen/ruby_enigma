require_relative 'view'
class Controller
  def initialize(attr = {})
    @plugboard = attr['plugboard']
    @view = View.new
    build_plugboard
  end

  # def start
  #   message = @view.request_message

  #   substituted_letters = message.gsub(' ', '').chars.map { |letter| @plugboard.substitute!(letter) }

  #   @view.display_message(substituted_letters.join)
  # end

  private

  def build_plugboard
    key_settings = {}

    response = @view.request_new_plugboard_settings

    until response.join == 'NEXT'
      key_settings[response[0]] = response[1]
      response = @view.request_new_plugboard_settings
    end

    @plugboard.update_connections(key_settings)
  end
end
