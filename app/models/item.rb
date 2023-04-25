class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :number

  validates :name         ,presence: true
  validates :content      ,presence: true
  validates :category_id  ,presence: true, numericality: { other_than: 1 }
  validates :condition_id ,presence: true, numericality: { other_than: 1 }
  validates :postage_id   ,presence: true, numericality: { other_than: 1 }
  validates :area_id      ,presence: true, numericality: { other_than: 1 }
  validates :number_id    ,presence: true, numericality: { other_than: 1 }
  validates :price        ,presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end