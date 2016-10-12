require 'rails_helper'

describe Vote do
  it { should have_valid(:vote).when(-1, 0, 1) }
  it { should_not have_valid(:vote).when(-2, 2) }
end
