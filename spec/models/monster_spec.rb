require 'rails_helper'

RSpec.describe Monster, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Monster do
  let(:attributes) do
    {
      name: "Dustwing",
      size: "tiny",
      taxonomy: "Abradacus nonexistus"
    }
  end

  it "is considered valid" do
    expect(Monster.new(attributes)).to be_valid
    # In RSpec, when you call a nonexistent matcher (such as be_valid), it strips off the be_ (valid), adds a question mark (valid?), and checks to see if the object responds to a method by that name (monster.valid?).
  end

  # Why did we use let to make an attribute hash?
  # We could have put the entire Monster.new call inside our let block, but using an attribute hash instead has some advantages:

  # If we want to tweak the data first, we can just pass attributes.merge(name: "Other") while preserving the rest of the attributes.
  # We can also refer to attributes when making assertions about what the actual object should look like.

  let(:missing_name) { attributes.except(:name) }
  let(:invalid_size) { attributes.merge(size: "not that big") }
  let(:missing_species) { attributes.merge(taxonomy: "Abradacus") }

  it "is invalid without a name" do
    expect(Monster.new(missing_name)).not_to be_valid
  end

  it "is invalid with an unusual size" do
    expect(Monster.new(invalid_size)).not_to be_valid
  end

  it "is invalid with a missing species" do
    expect(Monster.new(missing_species)).not_to be_valid
  end

end
