require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/visit.rb' )

# READ FUNCTIONS
get '/visit' do
  @visits = Visit.all()
  erb(:'visit/index')
end

get '/visit/new' do
  @countries = Country.all()
  @cities = City.all()
  erb(:'visit/new')
end

#CREATE FUNCTIONS
post '/visit/new' do
  visit = Visit.new(params)
  visit.save()
  redirect('/visit')
end

#UPDATE FUNCTIONS
get '/visit/:id/edit' do
  @cities = City.all()
  @visit = Visit.find(params[:id])
  erb(:'/visit/edit')
end

post '/visit/:id/update' do
  @visit = Visit.new(params)
  @visit.update()
  redirect('/visit')
end

#DELETE FUNCTIONS
post '/visit/:id/delete' do
  @visit = Visit.find(params[:id])
  @visit.delete()
  redirect ('/visit')
end
