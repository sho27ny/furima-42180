class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯々ー]+\z/, message: 'is invalid' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯々ー]+\z/, message: 'is invalid' }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\u30A0-\u30FFー－]+\z/, message: 'is invalid' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\u30A0-\u30FFー－]+\z/, message: 'is invalid' }
  validates :date, presence: true

  # パスワードの形式バリデーション（英字と数字の混合）
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "is invalid" }, if: :password_required?
  
  # password_required? メソッドを使って、新規登録時のパスワード確認を正しく行う
  def password_required?
    new_record? || password.present?
  end
end
