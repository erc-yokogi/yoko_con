class Contract < ActiveRecord::Base
  #2016/02/10 add
  #include Validation::Loader

  #set_primary_key :id
  #has_many :contracthaikibutsus
  has_many :items, dependent: :destroy
  validates :itakumoto,  presence: true, length: { maximum: 50 }
  validates :itakusaki, presence: true, length: { maximum: 20 }
  #validates :itakustart,  presence: true
  #validates :itakuend, presence: true

  #2016/02/12 add
 validate :contract_kikan_reverse
 validate :add_error_sample


  def contract_kikan_reverse
    #return true if self.itakustart.nil? || ! self.itakustart.is_a?(Date)
    if itakustart.blank? || itakuend.blank?
      #raise RuntimeError.new("itakukikan is null")
       errors.add(:itakustart, "itakukikan is null")
    else
     if itakustart.to_date <= itakuend.to_date
     #if Time.parse(itakustart) <= Time.parse(itakuend)
       #true
       #@contract.valid = false
     else
       ##return [false, ::I18n.t(:invalid_contract_kikan, scope: "validation.contract.contract_kikan")]
       false
       #raise RuntimeError.new("itakukikan is not valid")
       #@contract.valid?
       errors.add(:itakustart, "itakukikan is not valid")
     end
    end
  end

  def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if itakusaki.empty?
      #errors.add(:itakustart, "に関係するエラーを追加")
      #errors[:base] << "モデル全体に関係するエラーを追加"
    end
  end
  #2016/02/12 add end

  #2016/02/10 add
  #load_validation_group Validation::Contract::IncidentValidation, [:contract_detail]
  #load_validation_group Validation::Contract::IncidentValidation
# branch prep_search 2015/12/02

 def self.search(search)


   if search
     sql = 'SELECT C.* FROM contracts C WHERE itakumoto LIKE ?', "%#{search}%"
     #where(['itakumoto LIKE ?', "%{search}%"])
     #find_by(["itakumoto LIKE ?", "%#{search}%"])
     #find_by_sql(sql)
     #find_by_sql(['SELECT C.* FROM contracts C WHERE itakumoto LIKE ?', "%#{search}%"])
     #paginate_by_sql(sql,:page => params[:page], :per_page => 10)
     paginate_by_sql(sql, :page => pages)
     #paginate_by_sql(sql,:page => pages, :per_page => 10)
 
   else
     find_by_id(:all)
   end
 end
# branch prep_search 2015/12/02 end

end
