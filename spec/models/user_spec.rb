require 'rails_helper'

RSpec.describe User, type: :model do
  context '#import' do
    it 'should return the right name' do
      user = User.new
      expect(user.import).to(eq('John'))
    end
  end
end
