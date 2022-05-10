class SessionsController < Devise::SessionsController
  include ActionView::RecordIdentifier

  def create
    super
    resource.update(online: true)
    resource.broadcast_replace_to(
      "users_list", target: "#{dom_id resource}_row", partial: "users/user"
    )
  end

  def destroy
    current_user.update(online: false)
    current_user.broadcast_replace_to(
      "users_list", target: "#{dom_id current_user}_row", partial: "users/user"
    )
    super
  end
end
