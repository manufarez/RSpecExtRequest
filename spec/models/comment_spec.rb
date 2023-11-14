require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation' do
    it 'should validate content length' do
      comment = build(:comment_empty)
      comment.validate
      expect(comment.errors.messages).to(include(:post))
      expect(comment.valid?).to(be_falsey)
    end

    it 'should accept a good content' do
      comment = build(:comment, post: create(:post))
      comment.validate
      expect(comment.valid?).to(be_truthy)
    end
  end
end
