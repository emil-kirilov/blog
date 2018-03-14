require 'spec_helper'
require 'rails_helper'

describe 'User' do

  context 'asddddsa' do

    it 'das' do
      User.create(name: 'asd', email:'dsad@bad.vd', role: 0, password: 'sadasdasd')

      expect(User.count).to be 1
    end
  end
end
