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
end
