require 'sinatra'

get '/' do
  redirect '/bio', 301
end

get '/bio' do

bio = '''
Sofia Montgomery was born and raised in San Francisco, CA and moved to New York in 2009 to attend Fordham University. Throughout her childhood Sofia was involved in theatre and discovered her love of stage management at the age of 13.  Since then Sofia has pursued stage management in and outside of school, and has expanded that interest to company management.  Sofia has stage managed a variety of performances at Fordham University and in New York at various festivals and with Less Than Rent Theatre Company where she is a company member and company manager.  Sofia has also worked for companies such as Production Glue, CW & Co. and The Lawrence Company Events on corporate events and galas.  Last May Sofia graduated from Fordham University and soon became an AEA stage manager.  Sofia is currently the assistant stage manager of Summer Shorts  at 59E59.
'''
title = 'Bio'
image = 'http://i.imgur.com/Tu0bDyt.png'

  send_to_template :bio, {:title => title, :bio => bio, :image => image}
end

get '/projects' do
  projects = "Sofia is currently the assistant stage manager of Summer Shorts at 59E59.  Sofia is available for work again in September of 2014 to stage manage theatre or events."
  image = "http://i.imgur.com/CRksCgk.jpg"
  caption = "Rehearsal photo from Stockholm
Photo Credit Russ Rowland"
  send_to_template :projects, {:projects => projects, :image => image, :caption => caption}
end

get '/resume' do
  image = "http://i.imgur.com/4NC1Mzi.jpg"
  send_to_template :resume, {:image => image}
end

get '/contact' do
  send_to_template :contact, {}
end

post '/contact' do
  email = 'montgomerysofia@gmail.com'

  require 'pony'
  #TODO make it so that this doesn't go to spam
  #TODO figure out security
  Pony.mail({
    :from => params[:post][:email],
    :to => email,
    :subject => params[:post][:name] + "has contacted you via your website",
    :body => params[:post][:message]
  })

  confirm = 'Email sent!'
  send_to_template :contact, {:confirm => confirm}
end
