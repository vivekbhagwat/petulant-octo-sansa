require 'sinatra'

get '/' do
  "home"
end

get '/bio' do

bio = '''
bio here
'''
title = 'Bio'

  send_to_template :bio, {:title => title, :bio => bio}
end

get '/projects' do
  "projects"
end

get '/resume' do
  "resume"
end

get '/contact' do
  "contact"
end

