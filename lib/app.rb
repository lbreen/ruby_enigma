require 'json'
require_relative 'plugboard'
require_relative 'controller'

key_settings = JSON.parse(File.read('lib/key_settings.json'))

plugboard = Plugboard.new(key_settings['plugboard'])

controller = Controller.new({'plugboard' => plugboard})

controller.start
