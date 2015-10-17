=begin
Author: Kevin Austin
Math Calculator - calculates average, median, and standard deviation.
=end

def intro
	print "\nWelcome to Math Calculator\n"
end

def numbers()
	prompt = ">> "
	print "Enter your numbers: ", prompt
	usr_numbers = gets.chomp.split(" ")
	integer_array = usr_numbers.collect{|i| i.to_i}
	
	return integer_array
end

len = nil
	
def median(integer_array)
	integer_array.sort!
	if (integer_array.length % 2 == 1 )
		return integer_array[integer_array.length / 2.0]
	else
		return (integer_array[integer_array.length / 2] + integer_array[(integer_array.length / 2) - 1]) / 2.0
	end
end

def average(integer_array)
	total = integer_array.inject(:+)
	len = integer_array.length
	avg = total.to_f / len
	return avg
end

def standard_deviation(integer_array)
	variable = 0
	m = average(integer_array)
  	sum = integer_array.inject(0){ |add, i| add + (i - m)**2 }
  	variable = sum / (integer_array.length - 1).to_f
	
	return Math.sqrt(variable).round(1)
end

def calc_type
  prompt = ">> "
  print "[N]umbers [A]verage [M]edian [S]tandard Deviation [C]lear [Q]uit: ", prompt
  operat_select = gets.chomp.upcase

  if operat_select == "N"
	return "numbers"
  elsif operat_select == "A" 
    return "average"
  elsif operat_select == "M"
    return "median"
  elsif operat_select == "S"
    return "standard_deviation"
  elsif operat_select == "C"
    return "clear"
  elsif operat_select == "Q"
    return "quit"
  else
	return "error"
  end
end

def calc_ans(operation, integer_array )
  if operation == "average"
    return average(integer_array)
  elsif operation == "median"
    return median(integer_array)
  elsif operation == "standard_deviation"
    return standard_deviation(integer_array)
  end
end

prompt = ">> "
intro()
usr_int = Array.new

begin
  present_calc = calc_type()
  
  if present_calc == "error"
    puts "Oops!! Must select valid option. Try again?\n"  
  elsif present_calc == "numbers"
	usr_int.concat(numbers())
  elsif present_calc == "average"
  	avg_ans = calc_ans(present_calc, usr_int)
		print "Average number: ", avg_ans, "\n"
  elsif present_calc == "median"
  	med_ans = calc_ans(present_calc, usr_int)
		print "Median number: ", med_ans, "\n"
  elsif present_calc == "standard_deviation"
  	sd_ans = calc_ans(present_calc, usr_int)
	    print "Standard Deviation number: ", sd_ans, "\n"
  elsif present_calc == "clear"
	usr_int.clear()
  elsif present_calc == "quit"
	print "\nThanks for trying out Math Calculator!\n"
  end
end while present_calc != "quit"
