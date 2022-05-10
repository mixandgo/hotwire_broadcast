class RegistrationsController < Devise::RegistrationsController
  include ActionView::RecordIdentifier

  def create
    super
    resource.update(online: true)
  end
end

