require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { should have_valid(:first_name).when("Lisa", "David") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Carroll", "Kim") }
  it { should_not have_valid(:last_name).when(nil, "") }

end
