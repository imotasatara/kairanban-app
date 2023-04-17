class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name, :first_name, :last_name_kana, :first_name_kana,
              :address, :phone_number, :relationship_id, :emergency_contact
  end

  has_many :informations
end
