
FactoryGirl.define do
  factory :project_menu, :class => Refinery::ProjectMenus::ProjectMenu do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

