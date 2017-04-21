class ChargesController < ApplicationController
    def new
    end
  
  # Creating a stripe customer object for associating with the charge
  def create
      # Amount in cents
      @amount = 1500
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      current_user.stripe_id = customer.id
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    
      current_user.role = 'premium'
      current_user.save!
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end