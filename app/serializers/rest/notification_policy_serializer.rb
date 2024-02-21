# frozen_string_literal: true

class REST::NotificationPolicySerializer < ActiveModel::Serializer
  attributes :filter_everyone,
             :filter_not_following,
             :filter_not_followers,
             :filter_new_accounts,
             :summary

  def summary
    {
      pending_requests_count: object.pending_requests_count.to_s,
      pending_notifications_count: object.pending_notifications_count.to_s,
    }
  end
end
