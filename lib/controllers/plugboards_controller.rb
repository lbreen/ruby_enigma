require_relative '../views/plugboard_view'
require 'pry-byebug'

class PlugboardsController
  def initialize(plugboard)
    @plugboard = plugboard
    @view = PlugboardView.new
  end

  def edit
    new_connections = []

    #  Request new plugboard settings from the user
    response = @view.request_new_plugboard_settings

    #  Format the user response
    until response == 'NEXT'
      new_connections << response.split('')
      response = @view.request_new_plugboard_settings
    end

    update(new_connections)
  end

  def update(new_connections)
    return false unless valid?(new_connections)

    new_connections.each do |key, value|
      @plugboard.characters[key] = value
      @plugboard.characters[value] = key
    end
  end

  private

  def valid?(connections)
    keys = connections.map { |key, _value| key }
    values = connections.map { |_key, value| value }
    keys_and_values = keys + values
    return false if keys.count != keys.uniq.count # Are any keys duplicated?
    return false if values.count != values.uniq.count # Are any values duplicated?
    return false if keys_and_values.count != keys_and_values.uniq.count # Are any keys also values, and visa versa?
    true
  end
end
