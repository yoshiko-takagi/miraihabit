# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize

      # grant_on 'user_challenges#create', badge_id: 1, temporary: true do |user_challenge|
      #   user_challenge.user.total_score < 200
      # end

      # grant_on 'user_challenges#dashboard', badge_id: 2, temporary: true do |user|
      #   user.itself.total_score < 1000
      # end

      # upper line working ☝️
      grant_on 'users/registrations#create', badge_id: 1, model_name: 'User'

      # grant_on 'user_challenges#dashboard', badge_id: 1, to: :action_user, temporary: true do |user|
      # user.total_score < 200
      # end

      grant_on 'user_challenges#dashboard', badge_id: 2, to: :action_user do |user_challenge|
        user_challenge.user.total_score < 400 || user_challenge.user.total_score > 200
      end

      grant_on 'user_challenges#dashboard', badge_id: 3, to: :action_user do |user_challenge|
        user_challenge.user.total_score < 600 || user_challenge.user.total_score > 400
      end

      grant_on 'user_challenges#dashboard', badge_id: 4, to: :action_user do |user_challenge|
        user_challenge.user.total_score < 800 || user_challenge.user.total_score > 600
      end

      grant_on 'user_challenges#dashboard', badge_id: 5, to: :action_user do |user_challenge|
        user_challenge.user.total_score < 1000 || user_challenge.user.total_score > 800
      end

      grant_on 'user_challenges#dashboard', badge_id: 6, to: :action_user do |user_challenge|
        user_challenge.user.total_score <= 1000
      end
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
    end
  end
end
