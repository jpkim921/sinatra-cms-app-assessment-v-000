class UsersController < ApplicationController

  get '/user/signup' do

    if !logged_in?
      erb :'/users/signup'
    else
      redirect '/activities'
    end
    #
    # # "TEST"
    # erb :'/user/signup'
  end

  post '/user/signup' do
    if params.values.any?{|param| param == ""}
      redirect '/users/signup'
    else
      user = User.create(params)
      session[:user_id] = user.id
      redirect '/activities'
    end
  end


end
