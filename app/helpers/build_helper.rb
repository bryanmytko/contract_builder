module BuildHelper

	def featuresArray
		features = [
												 'Content Management',
												 'Forms',
												 'Events',
												 'Media Content',
												 'Store & Location Items',
												 'Polls',
												 'Third-party Solutions',
												 'Other Pages',
												 'Banners',
												 'Live Chat',
												 'Multiple Languages',
												 'Ecommerce - Login & Registration',
												 'Ecommerce - User Accounts',
												 'Ecommerce - Product Category Management',
												 'Ecommerce - Products Management',
												 'Ecommerce - Customer Relationship Management',
												 'Ecommerce - Promotions',
												 'Ecommerce - Product Search & Other Pages',
												 'Ecommerce - Shopping Cart',
												 'Ecommerce - Checkout',
												 'Ecommerce - Other',
												 'Ecommerce - Setup'
											 ]
	end
	
	def get_value(name)
		if (!@build.saved_state.nil?)
			@build.saved_state.each do |k,v|
				if k.include? 'design'
					k = k.gsub('_',' ')
					if k.include? name
						return v
					end
				end
			end
		end
		return 0
	end
	
end
