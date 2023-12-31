require 'rails_helper'

RSpec.describe "Comments", type: :request do

  let(:dummy_post) { create(:post)}

  describe 'POST #create' do
    context 'invalid params' do
      before do
        post "/posts/#{dummy_post.id}/comments", params: { post_id: dummy_post.id, comment: attributes_for(:comment_empty) }
      end

      it 'should return an error' do
        expect(response).to(have_http_status(422))
      end

      it 'should contain the error' do
        json = JSON.parse(response.body)
        expect(json).to(include('content'))
      end
    end

    context 'valid params' do
      before do
        post "/posts/#{dummy_post.id}/comments", params: { post_id: dummy_post.id, comment: attributes_for(:comment) }
      end

      it 'should return 200' do
        expect(response).to(have_http_status(200))
      end

      it 'should contain the comment' do
        json = JSON.parse(response.body)
        expect(json).to(include('content'))
        expect(json).to(include('id'))
      end

      it 'should persist comment' do
        expect(Comment.count).to(eq(1))
      end

      it 'should attach the comment to the right post' do
        expect(dummy_post.comments.count).to(eq(1))
      end
    end
  end
end
