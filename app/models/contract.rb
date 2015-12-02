class Contract < ActiveRecord::Base

  #set_primary_key :id

  validates :itakumoto,  presence: true, length: { maximum: 50 }
  validates :itakusaki, presence: true

end
