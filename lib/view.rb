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

  def request_new_key_settings(component)
    puts "Please enter the key settings for the #{component}."
    puts 'Each key pair should be seperated by commas and a space'
    puts 'Eg -> AB, BD, GT, RF...'
    print '>'
    gets.chomp.upcase
  end
end
