class Item < ActiveRecord::Base
  attr_accessible :comment, :done, :name, :position
  belongs_to :list

  after_initialize :default_values

  validates :name, presence: true, allow_nil: false

  private
    def default_values
      self.done ||= false
    end

end
