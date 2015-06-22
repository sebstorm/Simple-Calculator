require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'lib/calculate.rb'

total = Calculate.new


get "/calculator" do 
	erb :calculator
end

post "/calculator" do
	@user_input_1 = params[:user_input_1].to_i
	@user_input_2 = params[:user_input_2].to_i
	@operation = params[:operation]

	@total_add = total.add(@user_input_1, @user_input_2)
	@total_sub = total.subtract(@user_input_1, @user_input_2)
	# @total_mul = total.multiply(@user_input_1, @user_input_2)
	# @total_div = total.divide(@user_input_1, @user_input_2)

	erb :total
end
