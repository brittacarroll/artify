require 'rails_helper'

RSpec.describe Artwork, type: :model do
  it { should belong_to :artist }

  it { should have_valid(:title).when("The Artist", "Cool") }
  it { should_not have_valid(:title).when(nil, "") }
end
