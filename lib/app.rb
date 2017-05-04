require 'json'
require_relative 'plugboard'
require_relative 'rotor'
require_relative 'controller'

key_settings = JSON.parse(File.read('lib/key_settings.json'))

plugboard = Plugboard.new(key_settings['plugboard'])

rotor_one = Rotor.new({character_set: key_settings['rotor_one'], start_letter: "C"})

controller = Controller.new({'plugboard' => plugboard})

controller.start
