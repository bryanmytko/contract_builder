module BuildHelper
  
  def cms_class(cms)
    if ( cms == @build.cms_type )
      ''
    else
    ' cms_selection_hidden'
   end
  end

  #array of features
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
	
	#restore saved states for text inputs
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
	
	#restore saved states for check marks
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
	
	#if there is a modification already for this record, find its id (Design, Frontend)
	def get_modification(template_id,build_id)
	  @modification = Modification.find_all_by_build_id(build_id)
	  @modification.each do |m|
	    if(m.template_id == template_id)
	      return m.id
	    end
    end
    return 0
	end
	
	#if there is a modification already for this record, find its id (CMS pages)
	def get_page_modification(template_id, build_id)
	  @modification_page = ModificationPages.find_all_by_build_id(build_id)
	  @modification_page.each do |m|
	    if(m.template_id.to_s == template_id)
	      return m.id
	    end
	  end
	  return 0
	end
	
	#check if modifications exist and apply them if so
	def apply_mods(group_type, input_field, current_value, id)
	  if(group_type == 'cms')
	    mod = @modification_pages #set in controller
    else
	    mod = @modifications #set in controller
	  end
	  mod.each do |m|
	    if(id == m.template_id.to_s)
	      return m.send(input_field.to_sym)
	    end
	  end
	  return current_value
	end
	
end