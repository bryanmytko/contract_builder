module OutputHelper
  
  def is_selected(name)
    unless @build.saved_state.nil?
      @build.saved_state.each do |k,v|
        if((k.include? name.gsub(' ', '_')) && (v != '0'))
          return name
        end
      end
    end
    return false
  end
  
  def is_cms_selected(name)
    unless @build.saved_state.nil?
      @build.saved_state.each do |k,v|
        if((k.include? name) && (v == 'on'))
          return true
        end
      end
    end
    return false
  end
    
  def check_mod(obj)
    unless @modifications.nil?
      @modifications.each do |m|
        if(obj.id.to_s == m.template_id.to_s)
          return m
        end
      end
    end
    return obj
  end
  
  def check_cms_mod(obj)
    unless @modification_pages.nil?
      @modification_pages.each do |m|
        if(obj.id.to_s == m.template_id.to_s)
          return m
        end
      end
    end
    return obj
  end
  
  def get_hours(type)
    i = 0
    unless @types[type].nil?
      @types[type].each do |d|
        if(is_selected(d.name))
      	  d = check_mod(d)
      	  name = type + '_' + d.name.gsub(' ','_') + '_hours'
      	  quantity = @build.saved_state[name]
          i += (d.hours.to_i * quantity.to_i)
        end
      end
    end
    return i
  end
  
  def get_cms_hours
    hours = 0
    unless @build.cms_type.nil?
      @cms[@build.cms_type].each do |c|
        if(is_cms_selected(c.name))
          c = check_cms_mod(c)
          hours += c.hours.to_i
        end
      end
    end
    return hours
  end
  
  def get_cms_cost
    cost = 0
    unless @build.cms_type.nil?
      @cms[@build.cms_type].each do |c|
        if(is_cms_selected(c.name))
          cost += c.cost.to_i
        end
      end
    end
    return cost
  end
  
  def display_description(type)
    unless @types[type].nil?
      @types[type].each do |d|
        if(is_selected(d.name))
          d = check_mod(d)
          description = @build.saved_state[description]
          puts description
        end
      end
    end
  end
  
  def cms_type
    unless @build.cms_type.nil?
      @build.cms_type.capitalize
    end
    'No CMS Selected.'
  end
  
end
