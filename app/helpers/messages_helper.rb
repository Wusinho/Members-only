module MessagesHelper

def appNotice
  if flash[:notice]
    content_tag(:div, flash[:notice], class:["alert", "alert-info", "mt-0" ])
  end
end

def appAlert

  if flash[:alert] 
    content_tag(:div, flash[:alert], class:["alert", "alert-info", "mt-0" ])
   end 

  end

def ifNavabar
  if user_signed_in?
    link_to('Sign Out', destroy_user_session_path, method: :delete, class: "nav-link" ) +
    content_tag(:a, current_user.username, class:["nav-link", "disabled" ])
  else
   link_to('Sign In', user_session_path, class: "nav-link active"  )
  end
end

def ifFeed(message)
  if user_signed_in?
    content_tag(:div, message.user.username, class:"card-header" )
  else
    "@Hidden-guY"
  end 
end

def propertiesFEED(message)
  if user_signed_in? and current_user.id == message.user_id

      link_to('Edit', edit_message_path(message) )  + 
      link_to('Destroy', message, method: :delete, data: { confirm: 'Are you sure?' } ) 
    
    
 
  end 

end

def feedSigned

if user_signed_in?
  

 render 'form'

end
end





end
