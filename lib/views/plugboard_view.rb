class PlugboardView
  def request_new_plugboard_settings
    puts 'Please enter the key settings for the plugboard.'
    puts 'Enter a key pair and hit ENTER.'
    puts "Type 'NEXT' when you have finished."
    puts 'Eg -> AB or ST'
    print '> '
    gets.strip.upcase
  end
end
