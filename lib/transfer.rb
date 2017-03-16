require 'pry'

class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  end

  def valid?
  	if @sender.valid? && @receiver.valid?
  		true
  	else
  		false
  	end
  end

  def execute_transaction
  	#binding.pry


  	if @sender.balance < @amount
  		@status = "rejected"
  		"Transaction rejected. Please check your account balance."

  	elsif @sender.valid? &&  @status == "pending"
	  	@sender.deposit(-amount)
	  	@receiver.deposit(amount)
	  	@status = "complete"
	end
  end

  def reverse_transfer
  	if @status == "complete"
  		@sender.deposit(@amount)
  		@receiver.deposit(-@amount)
  		@status = "reversed"
  	end

  end

end
