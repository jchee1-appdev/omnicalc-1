class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num * @num
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @result = rand(@min..@max)
    render({ :template => "calculation_templates/random_results.html.erb"})
  end

  def blank_squareroot_form
    render({ :template => "calculation_templates/squareroot_form.html.erb"})
  end

  def calculate_squareroot
    @num = params.fetch("user_number").to_f
    @result = @num ** 0.5
    render({ :template => "calculation_templates/squareroot_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_i
    @pv = params.fetch("user_pv").to_f
    
    n = @years * 12
    r = (@apr / 100) / 12
    numerator = r * (@pv)
    denominator = 1 - (1 + r) ** (-n)
    
    result = numerator / denominator

    @output_apr = @apr.to_s(:percentage, { :precision => 4 } )
    @output_pv = @pv.to_s(:currency)
    @result = result.to_s(:currency)
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

end
