require 'sinatra'
require 'erb'
require 'date'

require_relative 'routes'

before do
  @classes_array = []
end

def preprocess
  @classes_array << cssify(request.path_info[1..-1])
end

def cssify(str)
  str = str.gsub("/\s|&nbsp;|\//", '-')
  str = str.gsub("/[^a-zA-Z0-9 -]/", '')
  return str
end

def send_to_template(template, vars)
  preprocess
  vars[:classes] = @classes_array.join(' ')
  vars[:year] = DateTime.now.year
  erb template, :locals => vars
end

