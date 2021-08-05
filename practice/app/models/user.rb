class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    validates :age, presence: true
    validates_numericality_of :age, on: :create
    validates_numericality_of :age, greater_than: 10, less_than: 150
    validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
