#!/usr/bin/env crystal

def calibration_val(str)
  digits = str.gsub(/(one|two|three|four|five|six|seven|eight|nine)/, {
    "one": "1",
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9"
  })
  digits = digits.gsub(/[a-z]/, nil)
  "#{digits.chars.first}#{digits.chars.last}".to_i
end

filename = ARGV.size > 0 ? ARGV.first : "input.txt"
file = File.read(filename)
sum = 0
file.each_line do |line|
  sum += calibration_val(line)
end
puts sum

