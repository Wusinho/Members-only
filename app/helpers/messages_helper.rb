module MessagesHelper
  def notice
    content_tag(:div, flash[:notice], class: %w[alert alert-info mt-0]) if flash[:notice]
  end

  def alert
    content_tag(:div, flash[:alert], class: %w[alert alert-info mt-0]) if flash[:alert]
  end

  def navbar
    if user_signed_in?
      link_to('Sign Out', destroy_user_session_path, method: :delete, class: 'nav-link') +
        content_tag(:a, current_user.username, class: %w[nav-link disabled])
    else
      link_to('Sign In', user_session_path, class: 'nav-link active')
    end
  end

  def feed(message)
    if user_signed_in?
      content_tag(:div, message.user.username, class: 'card-header')
    else
      '@Hidden-guY'
    end
  end

  def properties(message)
    return unless user_signed_in? and current_user.id == message.user_id

    link_to('Edit', edit_message_path(message)) +
      link_to('Destroy', message, method: :delete, data: { confirm: 'Are you sure?' })
  end

  def signed
    render 'form' if user_signed_in?
  end
end
