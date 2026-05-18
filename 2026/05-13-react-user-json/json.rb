# frozen_string_literal: true

require 'json'
require_relative 'data_generator_json'

# config
NUMBER = 50

users = DataGenerator.generate_users(NUMBER)
file_path = File.join(__dir__, 'users.json')

File.write(file_path, JSON.pretty_generate(users))

puts "Successfully created: #{file_path}"
