class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :orders      
has_many :reviews
has_many :cart_line_items
has_many :addresses

validates_presence_of :username, :mobile, :gender
validates_numericality_of :mobile
validates_length_of :mobile, is: 10

 end
