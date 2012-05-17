module OutputHelper
  
  def is_selected(name)
    @build.saved_state.each do |k,v|
      if((k.include? name.gsub(' ', '_')) && (v != '0'))
        return name
      end
    end
    return false
  end
  
  def is_cms_selected(name)
    @build.saved_state.each do |k,v|
      if((k.include? name) && (v == 'on'))
        return true
      end
    end
    return false
  end
    
  def check_mod(obj)
    @modifications.each do |m|
      if(obj.id.to_s == m.template_id.to_s)
        return m
        #abort(m.description)
      end
    end
    return obj
  end
  
  def get_hours(type)
    i = 0
    types = { 'design' => @designs, 'frontend' => @front_end }
    types[type].each do |d|
      if(is_selected(d.name))
    	  d = check_mod(d)
    	  name = type + '_' + d.name.gsub(' ','_') + '_hours'
    	  quantity = @build.saved_state[name]
        i += (d.hours.to_i * quantity.to_i)
      end
    end
    return i
  end
  
  def get_cms_hours
    hours = 0
    @cms[@build.cms_type].each do |c|
      if(is_cms_selected(c.name))
        hours += c.hours.to_i
      end
    end
    return hours
  end
  
  def get_cms_cost
    cost = 0
    @cms[@build.cms_type].each do |c|
      if(is_cms_selected(c.name))
        cost += c.cost.to_i
      end
    end
    return cost
  end  
  
end
