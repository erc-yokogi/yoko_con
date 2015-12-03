class Contract < ActiveRecord::Base

  #set_primary_key :id

  validates :itakumoto,  presence: true, length: { maximum: 50 }
  validates :itakusaki, presence: true, length: { maximum: 20 }

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
