require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_form)
end

get("/square_root/results") do
  @the_num_2 = params.fetch("users_number_2").to_f

  @square_root = @the_num_2 ** 0.5
  erb(:square_form_results)
end

get("/payment/new") do
  erb(:payment_form)
end

get("/payment/results") do
  @apr = params.fetch("users_number_2").to_f

  @square_root = @the_num_2 ** 0.5
  erb(:payment_form_results)
end
