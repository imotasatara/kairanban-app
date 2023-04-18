class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name, :first_name,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で記入してください'}
    validates :last_name_kana, :first_name_kana,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナで記入してください' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は"-(ハイフン)"を入れてください(例：123-4567)' }
    validates :address, length: { maximum: 20 }
    validates :phone_number, length: { in: 10..11, message: 'の桁数が違います("-(ハイフン)"は入れないでください)' }
    validates :emergency_contact,
              length: { in: 10..11, message: 'の桁数が違います("-(ハイフン)"は入れないでください)'},
              exclusion: { in: :phone_number, message: 'は電話番号と別の番号にしてください' }
  end

  validates :relationship_id, numericality: { other_than: 0, message: 'は"---"以外を選択してください' } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :relationship

  has_many :informations
end
