class Room < ApplicationRecord
  mount_uploader :image,ImageUploader
  belongs_to :user
  validates :name,presence: true,length:{maximum: 20}
  validates :fee, presence: true, numericality: true
  validates :address, presence: true
  validates :introduction,presence: true,length:{maximum: 500}
end