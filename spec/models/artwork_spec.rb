require 'rails_helper'

RSpec.describe Artwork, type: :model do
  it { should belong_to :artist }

  it { should have_valid(:title).when("The Artist", "Cool") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:description).when("This is an artwork", "My hobby") }
  it { should_not have_valid(:description.when(nil, "") }
end
