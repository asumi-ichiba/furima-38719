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

  validates :image        ,presence: true
  validates :name         ,presence: true
  validates :content      ,presence: true
  validates :category_id  ,presence: true, numericality: { other_than: 1 }
  validates :condition_id ,presence: true, numericality: { other_than: 1 }
  validates :postage_id   ,presence: true, numericality: { other_than: 1 }
  validates :area_id      ,presence: true, numericality: { other_than: 1 }
  validates :number_id    ,presence: true, numericality: { other_than: 1 }
  validates :price, presence: true,numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
end                                              