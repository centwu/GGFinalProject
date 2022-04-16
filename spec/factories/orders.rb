FactoryBot.define do
  factory :order do
    email { "MyString" }
    status { 1 }
    total { 1.5 }
  end
end
