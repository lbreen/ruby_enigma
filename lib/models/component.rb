require 'json'
require 'pry-byebug'

class Component
  # This is the parent class for all other models
  def initialize; end

  def substitute(index)
    @characters.find_index(@characters[index].rotate)
  end

  private

  def open_json
    JSON.parse(File.read('lib/db/key_settings.json'))
  end
end
