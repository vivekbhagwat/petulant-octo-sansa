require 'sinatra'

get '/' do
  redirect '/bio', 301
end

get '/bio' do

bio = '''
Sofia Montgomery was born and raised in San Francisco, CA and moved to New York in 2009 to attend Fordham University, majoring in stage management. Sofia has stage managed a variety of performances at venues such as New World Stages and 59E59 in New York. She has also had the opportunity to work on National Tours as well as the renowned Edinburgh Fringe Festival. Sofia has stage managed many new works as well as musicals and has expanded her skills to also stage manage events. In the event world Sofia has worked for companies such as Production Glue, Technical Producing Group and Bentley Meeker as a stage manager, talent wrangler, and production coordinator on a wide array of corporate events and galas. Sofia is an Actor\'s Equity Association stage manager and is also exploring other roles in the events and non-profit worlds.
'''
title = 'Bio'
image = 'http://i.imgur.com/J0nKX7J.jpg'
caption = ""

  send_to_template :bio, {:title => title, :bio => bio, :image => image, :caption => caption}
end

get '/projects' do
  projects = '''
Sofia is currently stage managing the <i>Brits Off Broadway</i> festival at 59E59 and available for work later in the summer.
'''
  image = "http://i.imgur.com/CRksCgk.jpg"
  caption = "Rehearsal photo from Stockholm
Photo Credit Russ Rowland"
  send_to_template :projects, {:projects => projects, :image => image, :caption => caption}
end

get '/resume' do
  image = "http://imgur.com/7qzpJcI.png"
  send_to_template :resume, {:image => image}
end

get '/contact' do
  send_to_template :contact, {}
end
