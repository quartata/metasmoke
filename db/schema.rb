# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_10_000945) do

  create_table "abuse_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "abuse_report_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abuse_report_id"], name: "index_abuse_comments_on_abuse_report_id"
    t.index ["user_id"], name: "index_abuse_comments_on_user_id"
  end

  create_table "abuse_contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "link"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "abuse_report_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.string "color"
  end

  create_table "abuse_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "reportable_type"
    t.bigint "reportable_id"
    t.bigint "abuse_contact_id"
    t.bigint "abuse_report_status_id"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abuse_contact_id"], name: "index_abuse_reports_on_abuse_contact_id"
    t.index ["abuse_report_status_id"], name: "index_abuse_reports_on_abuse_report_status_id"
    t.index ["reportable_type", "reportable_id"], name: "index_abuse_reports_on_reportable_type_and_reportable_id"
    t.index ["user_id"], name: "index_abuse_reports_on_user_id"
  end

  create_table "announcements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "text", collation: "latin1_swedish_ci"
    t.datetime "expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_keys", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.string "app_name"
    t.bigint "user_id"
    t.string "github_link"
    t.boolean "is_trusted"
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "api_tokens", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "code"
    t.integer "api_key_id"
    t.bigint "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expiry"
    t.index ["api_key_id"], name: "index_api_tokens_on_api_key_id"
    t.index ["user_id"], name: "index_api_tokens_on_user_id"
  end

  create_table "audits", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type", collation: "utf8mb4_bin"
    t.integer "associated_id"
    t.string "associated_type", collation: "utf8mb4_bin"
    t.integer "user_id"
    t.string "user_type", collation: "utf8mb4_bin"
    t.string "username", collation: "utf8mb4_bin"
    t.string "action", collation: "utf8mb4_bin"
    t.text "audited_changes", collation: "utf8mb4_bin"
    t.integer "version", default: 0
    t.string "comment", collation: "utf8mb4_bin"
    t.string "remote_address", collation: "utf8mb4_bin"
    t.string "request_uuid", collation: "utf8mb4_bin"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index", length: { associated_type: 191 }
    t.index ["auditable_id", "auditable_type"], name: "auditable_index", length: { auditable_type: 191 }
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", length: 191
    t.index ["user_id", "user_type"], name: "user_index", length: { user_type: 191 }
  end

  create_table "blazer_audits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement", collation: "latin1_swedish_ci"
    t.string "data_source", collation: "latin1_swedish_ci"
    t.timestamp "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state", collation: "latin1_swedish_ci"
    t.string "schedule", collation: "latin1_swedish_ci"
    t.text "emails", collation: "latin1_swedish_ci"
    t.string "check_type", collation: "latin1_swedish_ci"
    t.text "message", collation: "latin1_swedish_ci"
    t.timestamp "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "creator_id"
    t.text "name", collation: "latin1_swedish_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name", collation: "latin1_swedish_ci"
    t.text "description", collation: "latin1_swedish_ci"
    t.text "statement", collation: "latin1_swedish_ci"
    t.string "data_source", collation: "latin1_swedish_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "channels_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.string "secret", collation: "latin1_swedish_ci"
    t.string "link", collation: "latin1_swedish_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_channels_users_on_user_id"
  end

  create_table "commit_statuses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "commit_sha"
    t.string "status"
    t.string "commit_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ci_url"
  end

  create_table "deletion_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "post_id"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "api_key_id"
    t.integer "uncertainty"
    t.index ["post_id"], name: "post_id_ix"
  end

  create_table "domain_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", collation: "latin1_swedish_ci"
    t.text "description", collation: "latin1_swedish_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "domain_tags_posts", primary_key: ["domain_tag_id", "post_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "domain_tag_id", null: false
    t.bigint "post_id", null: false
  end

  create_table "domain_tags_spam_domains", primary_key: ["domain_tag_id", "spam_domain_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "domain_tag_id", default: 0, null: false
    t.integer "spam_domain_id", default: 0, null: false
  end

  create_table "dumps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "file_file_name", collation: "latin1_swedish_ci"
    t.string "file_content_type", collation: "latin1_swedish_ci"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "message_link"
    t.string "user_name"
    t.string "user_link"
    t.string "feedback_type"
    t.integer "post_id"
    t.string "post_link"
    t.integer "user_id"
    t.boolean "is_invalidated", default: false
    t.integer "invalidated_by"
    t.datetime "invalidated_at"
    t.integer "chat_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "api_key_id"
    t.string "chat_host"
    t.index ["post_id"], name: "index_feedbacks_on_post_id"
    t.index ["user_name"], name: "by_user_name", length: 5
  end

  create_table "flag_conditions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.boolean "flags_enabled", default: true
    t.integer "min_weight"
    t.integer "max_poster_rep"
    t.integer "min_reason_count"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flag_conditions_on_user_id"
  end

  create_table "flag_conditions_sites", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "flag_condition_id"
    t.integer "site_id"
  end

  create_table "flag_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.boolean "success"
    t.text "error_message", collation: "latin1_swedish_ci"
    t.integer "flag_condition_id"
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_dry_run"
    t.integer "backoff"
    t.integer "site_id"
    t.boolean "is_auto", default: true
    t.integer "api_key_id"
    t.index ["api_key_id"], name: "index_flag_logs_on_api_key_id"
    t.index ["created_at"], name: "index_flag_logs_on_created_at"
    t.index ["flag_condition_id"], name: "index_flag_logs_on_flag_condition_id"
    t.index ["post_id"], name: "index_flag_logs_on_post_id"
    t.index ["site_id"], name: "index_flag_logs_on_site_id"
    t.index ["user_id"], name: "index_flag_logs_on_user_id"
  end

  create_table "flag_settings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", collation: "utf8mb4_bin"
    t.string "value", collation: "utf8mb4_bin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "reason"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_completed", default: false
    t.bigint "post_id"
    t.index ["post_id"], name: "index_flags_on_post_id"
  end

  create_table "github_tokens", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "token", collation: "utf8mb4_bin"
    t.datetime "expires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moderator_sites", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "user_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_comments_on_post_id"
    t.index ["user_id"], name: "index_post_comments_on_user_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title", collation: "utf8mb4_unicode_ci"
    t.text "body", limit: 16777215, collation: "utf8mb4_unicode_ci"
    t.string "link", collation: "utf8mb4_unicode_ci"
    t.datetime "post_creation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "site_id"
    t.string "user_link", collation: "utf8mb4_unicode_ci"
    t.string "username", collation: "utf8mb4_unicode_ci"
    t.text "why", limit: 16777215, collation: "utf8mb4_unicode_ci"
    t.integer "user_reputation"
    t.integer "score"
    t.integer "upvote_count"
    t.integer "downvote_count"
    t.integer "stack_exchange_user_id"
    t.boolean "is_tp", default: false
    t.boolean "is_fp", default: false
    t.boolean "is_naa", default: false
    t.integer "revision_count"
    t.datetime "deleted_at"
    t.integer "smoke_detector_id"
    t.boolean "autoflagged", default: false
    t.string "tags", collation: "latin1_swedish_ci"
    t.integer "feedbacks_count"
    t.bigint "native_id"
    t.index ["autoflagged"], name: "index_posts_on_autoflagged"
    t.index ["created_at"], name: "index_posts_on_created_at"
    t.index ["feedbacks_count"], name: "index_posts_on_feedbacks_count"
    t.index ["is_fp"], name: "index_posts_on_is_fp"
    t.index ["is_naa"], name: "index_posts_on_is_naa"
    t.index ["is_tp"], name: "index_posts_on_is_tp"
    t.index ["link"], name: "index_posts_on_link", length: 191
  end

  create_table "posts_reasons", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "reason_id"
    t.integer "post_id"
    t.index ["post_id"], name: "index_posts_reasons_on_post_id"
    t.index ["reason_id"], name: "index_posts_reasons_on_reason_id"
  end

  create_table "posts_spam_domains", primary_key: ["post_id", "spam_domain_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "post_id", default: 0, null: false
    t.integer "spam_domain_id", default: 0, null: false
  end

  create_table "reasons", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "reason_name"
    t.string "last_post_title", collation: "utf8mb4_unicode_ci"
    t.boolean "inactive", default: false
    t.integer "weight", default: 0
    t.integer "maximum_weight", limit: 1
  end

  create_table "review_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "user_id"
    t.bigint "feedback_id"
    t.string "result", collation: "latin1_swedish_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feedback_id"], name: "index_review_results_on_feedback_id"
    t.index ["post_id"], name: "index_review_results_on_post_id"
    t.index ["user_id"], name: "index_review_results_on_user_id"
  end

  create_table "roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", collation: "utf8mb4_unicode_ci"
    t.string "resource_type", collation: "utf8mb4_unicode_ci"
    t.integer "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", length: { name: 191, resource_type: 191 }
    t.index ["name"], name: "index_roles_on_name", length: 191
  end

  create_table "site_settings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", collation: "latin1_swedish_ci"
    t.string "value", collation: "latin1_swedish_ci"
    t.string "value_type", collation: "latin1_swedish_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "site_name", collation: "utf8mb4_bin"
    t.string "site_url", collation: "utf8mb4_bin"
    t.string "site_logo", collation: "utf8mb4_bin"
    t.string "site_domain", collation: "utf8mb4_bin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "flags_enabled", default: false
    t.integer "max_flags_per_post", default: 1
    t.boolean "is_child_meta"
    t.datetime "last_users_update"
    t.string "api_parameter", collation: "latin1_swedish_ci"
  end

  create_table "sites_user_site_settings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "site_id"
    t.integer "user_site_setting_id"
  end

  create_table "smoke_detectors", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "last_ping"
    t.string "name", collation: "utf8mb4_unicode_ci"
    t.string "location", collation: "utf8mb4_unicode_ci"
    t.string "access_token", collation: "utf8mb4_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "email_date"
    t.bigint "user_id"
    t.boolean "is_standby", default: false
    t.boolean "force_failover", default: false
    t.index ["user_id"], name: "index_smoke_detectors_on_user_id"
  end

  create_table "spam_domains", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "domain", collation: "latin1_swedish_ci"
    t.text "whois", collation: "latin1_swedish_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stack_exchange_users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "username", collation: "utf8mb4_unicode_ci"
    t.datetime "last_api_update"
    t.boolean "still_alive", default: true
    t.integer "answer_count"
    t.integer "question_count"
    t.integer "reputation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
  end

  create_table "statistics", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "posts_scanned"
    t.integer "smoke_detector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "api_quota"
    t.float "post_scan_rate"
  end

  create_table "user_site_settings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "max_flags"
    t.integer "flags_used", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_site_settings_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "username"
    t.integer "stackexchange_chat_id"
    t.integer "meta_stackexchange_chat_id"
    t.integer "stackoverflow_chat_id"
    t.integer "stack_exchange_account_id"
    t.boolean "flags_enabled", default: false
    t.string "encrypted_api_token", collation: "latin1_swedish_ci"
    t.string "two_factor_token", collation: "latin1_swedish_ci"
    t.boolean "enabled_2fa"
    t.binary "salt"
    t.binary "iv"
    t.boolean "announcement_emails"
    t.boolean "oauth_created"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "users_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.boolean "pinned", default: false
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  add_foreign_key "abuse_comments", "abuse_reports"
  add_foreign_key "abuse_comments", "users"
  add_foreign_key "abuse_reports", "abuse_contacts"
  add_foreign_key "abuse_reports", "abuse_report_statuses"
  add_foreign_key "abuse_reports", "users"
  add_foreign_key "api_keys", "users"
  add_foreign_key "api_tokens", "api_keys"
  add_foreign_key "api_tokens", "users"
  add_foreign_key "channels_users", "users"
  add_foreign_key "flag_conditions", "users"
  add_foreign_key "flag_logs", "api_keys"
  add_foreign_key "flag_logs", "flag_conditions"
  add_foreign_key "flag_logs", "posts"
  add_foreign_key "flag_logs", "sites"
  add_foreign_key "flag_logs", "users"
  add_foreign_key "flags", "posts"
  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_comments", "users"
  add_foreign_key "review_results", "feedbacks"
  add_foreign_key "review_results", "posts"
  add_foreign_key "review_results", "users"
  add_foreign_key "smoke_detectors", "users"
  add_foreign_key "user_site_settings", "users"
end
