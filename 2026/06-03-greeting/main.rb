time = Time.now
now_hour = time.hour

case now_hour
when 0..10
  puts "Good Morning"
when 11..16
  puts "Good Afternoon"
when 17..23
  puts "Good Evening"
end
