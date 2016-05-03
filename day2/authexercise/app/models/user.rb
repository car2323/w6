class User < ActiveRecord::Base
  has_secure_password #esto es un comando de rails. para facilitar las cosas
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
  	unless self.role
  		self.role = :role
  	end	
  end
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
