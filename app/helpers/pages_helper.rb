module PagesHelper
	def balance_status(user)
		balance = Purchase.balance(user)
		balance > 10_000 ? 'label-red': 'label-green'
	end
end
