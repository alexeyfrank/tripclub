class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, email: true
  validates :password, presence: true

  # state_machine initial: :waiting_confirmation do
  #   state :waiting_confirmation
  #   state :inactive
  #   state :active

  #   event :confirm do
  #     transition [:waiting_confirmation, :inactive] => :active
  #   end

  #   event :deactivate do
  #     transition [:waiting_confirmation, :active] => :inactive
  #   end

  # end

  include UserRepository
end
