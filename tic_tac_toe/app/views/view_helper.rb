module ViewHelper

  def sleep_clear_screen
    my_sleep
    clear_screen
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def my_sleep
    4.times do
      print(".")
      sleep(0.5)
    end
    puts ""
  end

  def header(title)
    width = 30
    title_length = title.length
    title += " " if title_length.odd?
    border = "=" * width + "\n"
    stars = "*" * (((width - title.length)/2) - 1)
    puts "#{border}#{stars} #{title} #{stars}\n#{border}"
  end

#Errors
  def input_error_y_n
    puts "Sorry, but your input was invalid. Please enter 'Y' or 'N'."
  end

  def input_error_x_o
    puts "Sorry, but your input was invalid. Please enter 'X' or 'O'."
  end

end#ViewHelper