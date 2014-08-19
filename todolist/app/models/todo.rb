class Todo < ActiveRecord::Base
  belongs_to :user

  #validates :name, :status, :presence => true
  #validates :name, :length => { :minimum => 2}
  #validates :name, :uniqueness => { :message => "already taken"}
end
