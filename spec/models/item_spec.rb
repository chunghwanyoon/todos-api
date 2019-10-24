require 'rails_helper'


# Test suite for the item model
RSpec.describe Item, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belongs_to(:todo) }

  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
  
end

# RSpec.describe Item, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
