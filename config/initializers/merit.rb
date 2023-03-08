# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grant badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

Rails.application.reloader.to_prepare do
  Merit::Badge.create!(
    id: 1,
    name: "turtle-1",
    description: "First step on the journey to clear turtle"
  )
  Merit::Badge.create!(
    id: 2,
    name: "turtle-2",
    description: "Second step on the journey to clear turtle"
  )
  Merit::Badge.create!(
    id: 3,
    name: "turtle-3",
    description: "Third step on the journey to clear turtle"
  )
  Merit::Badge.create!(
    id: 4,
    name: "turtle-4",
    description: "Fourth step on the journey to clear turtle"
  )
  Merit::Badge.create!(
    id: 5,
    name: "turtle-5",
    description: "Fifth step on the journey to clear turtle"
  )
  Merit::Badge.create!(
    id: 6,
    name: "turtle-6",
    description: "Last step on the journey to clear turtle"
  )
end




# Create application badges (uses https://github.com/norman/ambry)
# Rails.application.reloader.to_prepare do
#   badge_id = 0
#   [{
#     id: (badge_id = badge_id+1),
#     name: 'just-registered'
#   }, {
#     id: (badge_id = badge_id+1),
#     name: 'best-unicorn',
#     custom_fields: { category: 'fantasy' }
#   }].each do |attrs|
#     Merit::Badge.create! attrs
#   end
# end
