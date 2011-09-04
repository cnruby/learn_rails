class Book < ActiveRecord::Base
  belongs_to :author

  def self.allowed(subject, object)
     rules = []
     return rules unless subject && subject.instance_of?(Book)
     rules << :read_book if subject.public?
     rules << :edit_book if object && object.id == subject.author_id
     rules
  end
end
