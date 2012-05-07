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
	
	def get_value(name,type)
		if (!@build.saved_state.nil?)
			@build.saved_state.each do |k,v|
				if k.include? type
					k = k.gsub('_',' ')
					if k.include? name
						return v
					end
				end
			end
		end
		return 0
	end
	
	def is_checked(name)
	  if (!@build.saved_state.nil?)
	    @build.saved_state.each do |k,v|
	      if k.include? name
	        return 'checked=true'
	      end
	    end
	  return 0
	  end
	end
	
	def is_cms_selected(cms_type)
	  if (cms_type == @build.cms_type)
	    return ''
	  else
	    return ' cms_selection_hidden'
	  end
	end
	
	def get_modification(design_id,build_id)
	  @modification = Modification.find_all_by_build_id(build_id)
	  @modification.each do |d|
	    if(d.design_id == design_id)
	      return d.id
	    else
	      return 0
	    end
    end
    return 0
	end
	
	def apply_mods(input_field, current_value, id)
	  @modifications.each do |m|
	    if(id == m.design_id.to_s)
	      return m.send(input_field.to_sym)
	    end
	  end
	  return current_value
	end
	
end
