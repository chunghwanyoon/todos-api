require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Todo, type: :model do
  
  # Association test
  # ensure Todo model has a 1:m relationship with the item model
  it { should have_many(:items).dependent(:destory) }

  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }

end

#   pending "add some examples to (or delete) #{__FILE__}"
# end
