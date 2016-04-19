require 'rails_helper'

RSpec.describe Gallery, type: :model do
  it { should have_valid(:name).when("Artiste", "La Mode") }
  it { should_not have_valid(:name).when(nil, "") }
  it { should have_valid(:representative_name).when("Carin Smith", "Kim") }
  it { should_not have_valid(:representative_name).when(nil, "") }
end
