class Course < ApplicationRecord
  # Direct associations

  has_many   :assignments,
             :dependent => :destroy

  belongs_to :user,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
