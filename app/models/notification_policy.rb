# frozen_string_literal: true

# == Schema Information
#
# Table name: notification_policies
#
#  id                   :bigint(8)        not null, primary key
#  account_id           :bigint(8)        not null
#  filter_everyone      :boolean          default(FALSE), not null
#  filter_not_following :boolean          default(FALSE), not null
#  filter_not_followers :boolean          default(FALSE), not null
#  filter_new_accounts  :boolean          default(FALSE), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class NotificationPolicy < ApplicationRecord
  belongs_to :account

  attr_reader :pending_requests_count, :pending_notifications_count

  def summarize!
    @pending_requests_count, @pending_notifications_count = NotificationRequest.where(account: account, dismissed: false).pick(Arel.sql('count(*), sum(notifications_count)::bigint'))
  end
end
