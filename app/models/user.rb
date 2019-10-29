class User < ApplicationRecord

  has_many :products

  after_initialize :set_default_role, if: :new_record?
  validates :roles, presence: true


  def set_default_role
    self.add_role(:normal)
  end

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
