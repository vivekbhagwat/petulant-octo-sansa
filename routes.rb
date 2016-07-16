require 'sinatra'

get '/' do
  redirect '/bio', 301
end

get '/bio' do

bio = '''
Sofia Montgomery was born and raised in San Francisco, CA and moved to New York in 2009 to attend Fordham University, majoring in stage management. Throughout her childhood Sofia was involved in theatre and discovered her love of stage management at the age of 13. Sofia continued to pursue stage management at Fordham and has enjoyed the start of an exciting career as an AEA stage manager. Sofia has stage managed a variety of performances at venues such as New World Stages and 59E59. Sofia has stage managed many new works as well as musicals and has expanded her skills to also stage manage events. In the event world Sofia has worked for companies such as Production Glue and CW & Co. on corporate events and galas. Sofia graduated from Fordham University in 2013 and soon became an AEA stage manager. Sofia\'s favorite recent projects include a workshop of <i>Prosthesis</i> directed by Moritz von Stuelpnagel and written by Robert Askins, the Pipeline Festival at the Women\'s Project, several exciting new productions with One Year Lease Theater Company and volunteering as a stage manager for Broadway Cares.
'''
title = 'Bio'
image = 'http://i.imgur.com/eDilyQy.jpg'
caption = "Photo Credit Mai Demeterio"

  send_to_template :bio, {:title => title, :bio => bio, :image => image, :caption => caption}
end

get '/projects' do
  projects = '''
Sofia is currently excited to be traveling with One Year Lease Theater Company, stage managing <i>Please Excuse My Dear Aunt Sally</i> at the Edinburgh Fringe Festival.
'''
  image = "http://i.imgur.com/CRksCgk.jpg"
  caption = "Rehearsal photo from Stockholm
Photo Credit Russ Rowland"
  send_to_template :projects, {:projects => projects, :image => image, :caption => caption}
end

get '/resume' do
  image = "http://i.imgur.com/tZl4WD6.png"
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
    :cc => 'bhagwat.vivek@gmail.com',
    :subject => params[:post][:name] + " has contacted you via your website",
    :body => params[:post][:message]
  })

  confirm = 'Email sent!'
  send_to_template :contact, {:confirm => confirm}
end
