FactoryBot.define do
  factory :comment do
    content {'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.'}

    factory :comment_empty, parent: :comment do
      content {''}
    end
  end
end
