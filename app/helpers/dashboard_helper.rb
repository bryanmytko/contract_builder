module DashboardHelper
  def session_selected(tab)
    if session[:tab] != tab
      'dim '
    else
      ''
    end
  end
  
  def session_table(tab)
    if session[:tab] != tab
      ' hide'
    else
      ''
    end
  end

end
