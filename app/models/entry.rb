class Entry < ActiveRecord::Base
  has_many :addresses, :dependent => :destroy
  has_many :emails, :dependent => :destroy
  has_many :weburls, :dependent => :destroy

  accepts_nested_attributes_for :addresses, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :emails, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :weburls, :allow_destroy => true, :reject_if => :all_blank

  attr_accessible :first_name, :last_name, :addresses_attributes, :emails_attributes, :weburls_attributes

  validates :first_name, :last_name, :presence => true

  def name
    first_name.titleize + ' ' + last_name.titleize
  end

end
