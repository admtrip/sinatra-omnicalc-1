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
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f

  @monthly_rate = (@apr / 100) / 12
  @total_payments = @years * 12

  if @monthly_rate > 0
    @monthly_payment = @principal * (@monthly_rate / (1 - (1 + @monthly_rate) ** -@total_payments))
  else
    @monthly_payment = @principal / @total_payments
  end

  # ✅ Formatting per test expectations
  @formatted_apr = "#{@apr.round(4)}%" # Show APR as percentage
  @formatted_principal = @principal.to_fs(:currency) # "$14,600.00"
  @formatted_monthly_payment = @monthly_payment.to_fs(:currency) # "$263.90"

  erb(:payment_form_results)
end

require 'sinatra'

# 🟢 Route to display the random number form
get("/random/new") do
  erb(:random_form)
end

# 🟢 Route to process the random number request
get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  @random_number = rand(@min..@max).round(3) # ✅ Rounds to match expected format

  erb(:random_form_results)
end
