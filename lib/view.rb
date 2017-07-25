class View
  def request_message
    puts 'What is the message?'
    print '> '
    gets.chomp.upcase
  end

  def display_message(message)
    puts ''
    puts "Message: #{message}"
  end

  def request_new_plugboard_settings
    puts 'Please enter the key settings for the plugboard.'
    puts 'Enter a key pair and hit ENTER.'
    puts "Type 'NEXT' when you have finished."
    puts 'Eg -> AB or ST'
    print '> '
    gets.strip.upcase.split('')
  end
end
