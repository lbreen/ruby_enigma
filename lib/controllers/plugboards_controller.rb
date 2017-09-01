require_relative '../models/plugboard.rb'
require_relative '../views/plugboard_view'

class PlugboardsController
  def initialize
    @plugboard = Plugboard.new
    @view = PlugboardView.new
  end

  def edit
    @new_connections = {}

    response = @view.request_new_plugboard_settings

    until response.join == 'NEXT'
      @new_connections[response[0]] = response[1]
      response = @view.request_new_plugboard_settings
    end

    return false unless valid?(@new_connections)
    update
  end

  def update
    @new_connections.each do |key, value|
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
    return false if values.count != values.uniq.count # Are any keys duplicated?
    return false if keys_and_values.count != keys_and_values.uniq.count # Are any keys also values, and visa versa?
    true # If none of the above, return true
  end
end
