require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

puts "EventManager initialized!\n\n"

template_letter = File.read('form_letter.erb')
erb_template = ERB.new(template_letter)

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

content_size = contents_size = CSV.read('event_attendees.csv').length

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def valid_phone_number(phone_number)
  number_length = number_length(phone_number)
  index_of_one = phone_number.index('1')

  if number_length > 10 && index_of_one.zero?
    phone_number[1..-1]
  elsif (number_length > 10 && !index_of_one.zero?) || number_length < 10 || number_length > 10
    'Invalid number'
  else
    phone_number
  end
end

def number_length(number)
  count = 0
  number.split('').each do |i|
    count += 1 if i.match(/[0-9]/)
  end
  count
end

def date_to_obj(date)
  DateTime.strptime(date,"%m/%d/%y %H:%M")
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exists?('output')
  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def count_frequency(arr)
  freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  arr.max_by { |v| freq[v] }
end

hours_arr = []
days_arr = []

days_of_week = {0=>"Sunday",1=>"Monday",2=>"Tuesday",3=>"Wednesday",4=>"Thursday",5=>"Friday",6=>"Saturday"}
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  reg_date = date_to_obj(row[:regdate])
  home_phone = valid_phone_number(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  hours_arr.push(reg_date.hour)
  days_arr.push(reg_date.wday)

  puts "Loading data... Time remaining: #{content_size}"
  content_size -= 1

  # form_letter = erb_template.result(binding)
  # save_thank_you_letter(id,form_letter)
end

puts "The most frequent hour of the day is: #{count_frequency(hours_arr)}:00"
puts "The most common day of the week is: #{days_of_week[count_frequency(days_arr)]}"