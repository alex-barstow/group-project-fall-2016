require 'rails_helper'

describe Review do

  it { should have_valid(:rating).when(1, 5) }
  it { should_not have_valid(:rating).when(nil, 0, 6) }

end
