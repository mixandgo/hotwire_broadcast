class User < ApplicationRecord
  include ActionView::RecordIdentifier

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create_commit -> {
    broadcast_prepend_to "registrations", target: "users"
  }

  after_update_commit -> {
    broadcast_replace_to "registrations", target: "#{dom_id self}_row"
  }

  after_destroy_commit -> {
    broadcast_remove_to "registrations", target: "#{dom_id self}_row"
  }
end
