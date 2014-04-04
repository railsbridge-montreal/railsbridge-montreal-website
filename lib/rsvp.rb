#!/usr/bin/env ruby

require 'net/http'

# http://stackoverflow.com/questions/11399584/stdin-gets-produces-nil-when-file-is-attained-with-curl-and-piped-to-ruby
tty = STDIN.reopen('/dev/tty')

puts "What is your email address?"
email = $stdin.gets.chomp

uri = if ENV["DEVELOPMENT"]
  URI('http://0.0.0.0:3000/checks')
else
  URI('http://www.railsbridge-montreal.com/checks')
end

params = {
  "check[email]"         => email,
  "check[ruby_version]"  => RUBY_VERSION,
  "check[ruby_platform]" => RUBY_PLATFORM
}

# XXX make sure to output the response here... saying that it was a success or not
response = Net::HTTP.post_form(uri, params)
puts "Ruby is at version: #{RUBY_VERSION}!"
puts response.message

tty.close
