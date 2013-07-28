class List < ActiveRecord::Base
  attr_accessible :comment, :done, :name, :tags, :due_date
  has_and_belongs_to_many :user
  has_many :items

  after_initialize :default_values
  validates :name, presence: true, allow_nil: false

  private
    def default_values
      self.done ||= false
    end

end
