require 'openssl'

class User < ApplicationRecord
  # параметры работы модуля шифрования паролей
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  attr_accessor :password

  has_many :questions, dependent: :destroy

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :username, length: { maximum: 40 }, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates :email, format: { with: /@/ }
  validates :background_color, format: { with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i }

  before_save :encrypt_password
  before_validation { self.username.downcase! if attribute_present? 'username' }

  def encrypt_password
    if self.password.present?
      # создаем "соль" - случайная строка усложняющая задачу хакерам
      self.password_salt  = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      # создаем хэш пароля - длинная уникальная строка, из которой невозможно восстановить исходный пароль
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  # служебный метод, преобразующий бинарную строку в 16-ричный формат, для удобства хранения
  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email) # сперва находим кандидата по email

    # Обратите внимание: сравнивается password_hash, а оригинальный пароль так никогда и не сохраняется нигде!
    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end
end
