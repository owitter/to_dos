class Course < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
