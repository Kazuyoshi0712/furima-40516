class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角文字を使用してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角文字を使用してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'はカタカナで入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'はカタカナで入力してください' }
  validates :birth_date, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字で入力してください' }
end
