# frozen_string_literal: true

class AbuseReport < ApplicationRecord
  include Websocket

  belongs_to :user
  belongs_to :reportable, polymorphic: true
  belongs_to :contact, class_name: 'AbuseContact', foreign_key: 'abuse_contact_id'
  belongs_to :status, class_name: 'AbuseReportStatus', foreign_key: 'abuse_report_status_id'
  has_many :comments, class_name: 'AbuseComment', dependent: :destroy

  validates :reportable_type, presence: true, inclusion: { in: %w[SpamDomain Post] }

  before_validation do
    unless status.present?
      self.status = AbuseReportStatus[AbuseReportStatus::DEFAULT_STATUS]
    end
  end
end
