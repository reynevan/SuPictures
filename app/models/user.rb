class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    admins = ['p.suminski@gmail.com']
    if admins.include? self.email
      true
    else
      false
    end
  end
end
