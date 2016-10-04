require 'rails_helper'

describe User do

  it { should have_valid(:first_name).when('Jon', 'Steve') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Smith', 'George') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('user@example.com', 'users@gmail.com') }
  it { should_not have_valid(:email).when(nil, '', 'urser', 'ursersr@com', 'ursers.com') }

  it { should have_valid(:user_name).when('example', 'username') }
  it { should_not have_valid(:user_name).when(nil, '') }
end
