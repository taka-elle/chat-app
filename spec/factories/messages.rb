FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      # attachは指定したファイルを添付するメソッド
      # io:はinput,outputの略、File.openにより指定したファイルと結びつける
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end