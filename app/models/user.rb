class User < ApplicationRecord
  mount_uploader :icon,IconUploader
  validates :name,presence: true,length:{maximum: 20}
  validates :introduction,length:{maximum: 500}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
