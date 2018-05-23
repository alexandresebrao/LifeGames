class Order < ActiveRecord::Base
	 default_scope { order('created_at DESC') }
	 has_and_belongs_to_many  :products
	 belongs_to :address
	 belongs_to :user
	 validates :creditcardname, :creditcard, :creditcarddate, :creditcardcode, presence: true
	 validates :creditcard, :creditcarddate, :creditcardcode, numericality: { only_integer: true }
	 validates :creditcard, length: { is: 16 }
	 validates :creditcarddate, length: { is: 4 }
	 validates :creditcardcode, length: { in: 3..4 }
end


