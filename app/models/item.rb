class Item < ActiveRecord::Base
  belongs_to :contract

  validates :item,  presence: true
  validates :suryo, presence: true
  validates :tanka,  presence: true

end
