# frozen_string_literal: true

Fabricator(:notification_policy) do
  account
  filter_everyone      false
  filter_not_following false
  filter_not_followers false
  filter_new_accounts  false
end
