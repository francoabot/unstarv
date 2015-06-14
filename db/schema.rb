# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150614070949) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "comments", force: true do |t|
    t.string   "thor_name"
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string "iso"
    t.string "name"
  end

  create_table "group_memberships", force: true do |t|
    t.string  "member_type"
    t.integer "member_id"
    t.integer "group_id"
    t.string  "group_name"
    t.string  "membership_type"
  end

  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id"
  add_index "group_memberships", ["group_name"], name: "index_group_memberships_on_group_name"
  add_index "group_memberships", ["member_id", "member_type"], name: "index_group_memberships_on_member_id_and_member_type"

  create_table "group_posts", force: true do |t|
    t.text     "content"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_posts", ["group_id", "created_at"], name: "index_group_posts_on_group_id_and_created_at"
  add_index "group_posts", ["group_id"], name: "index_group_posts_on_group_id"
  add_index "group_posts", ["user_id", "created_at"], name: "index_group_posts_on_user_id_and_created_at"
  add_index "group_posts", ["user_id"], name: "index_group_posts_on_user_id"

  create_table "groupcomments", force: true do |t|
    t.integer  "groupost_id"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "body"
  end

  add_index "groupcomments", ["group_id"], name: "index_groupcomments_on_group_id"
  add_index "groupcomments", ["groupost_id", "created_at"], name: "index_groupcomments_on_groupost_id_and_created_at"
  add_index "groupcomments", ["groupost_id"], name: "index_groupcomments_on_groupost_id"
  add_index "groupcomments", ["user_id", "created_at"], name: "index_groupcomments_on_user_id_and_created_at"
  add_index "groupcomments", ["user_id"], name: "index_groupcomments_on_user_id"

  create_table "groupes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grouposts", force: true do |t|
    t.text     "content"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grouposts", ["group_id", "created_at"], name: "index_grouposts_on_group_id_and_created_at"
  add_index "grouposts", ["group_id"], name: "index_grouposts_on_group_id"
  add_index "grouposts", ["user_id", "created_at"], name: "index_grouposts_on_user_id_and_created_at"
  add_index "grouposts", ["user_id"], name: "index_grouposts_on_user_id"

  create_table "groups", force: true do |t|
    t.string  "type"
    t.text    "description"
    t.string  "group_name"
    t.string  "privacy_type"
    t.integer "score"
    t.string  "expertise"
    t.string  "country"
    t.string  "state"
    t.string  "category"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "mailboxer_conversation_opt_outs", force: true do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"

  create_table "mailboxer_conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type"

  create_table "mailboxer_receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.integer  "group_id"
  end

  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "rs_evaluations", force: true do |t|
    t.string   "reputation_name"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.float    "value",           default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
  end

  add_index "rs_evaluations", ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true
  add_index "rs_evaluations", ["reputation_name"], name: "index_rs_evaluations_on_reputation_name"
  add_index "rs_evaluations", ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type"
  add_index "rs_evaluations", ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type"

  create_table "rs_reputation_messages", force: true do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.float    "weight",      default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rs_reputation_messages", ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true
  add_index "rs_reputation_messages", ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id"
  add_index "rs_reputation_messages", ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type"

  create_table "rs_reputations", force: true do |t|
    t.string   "reputation_name"
    t.float    "value",           default: 0.0
    t.string   "aggregated_by"
    t.integer  "target_id"
    t.string   "target_type"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
  end

  add_index "rs_reputations", ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true
  add_index "rs_reputations", ["reputation_name"], name: "index_rs_reputations_on_reputation_name"
  add_index "rs_reputations", ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type"

  create_table "states", force: true do |t|
    t.string  "name"
    t.integer "country_id"
    t.string  "iso"
  end

  create_table "users", force: true do |t|
    t.string   "firtname"
    t.string   "lastName"
    t.string   "username"
    t.string   "email"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "profession"
    t.string   "industry"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest"
    t.boolean  "admin",                  default: false
    t.string   "remember_token"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "encrypted_password"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.string   "unconfirmed_email"
    t.datetime "remember_created_at"
    t.datetime "current_signed_in_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "deleted_at"
    t.integer  "score",                  default: 0
    t.boolean  "active",                 default: true
    t.string   "artist",                 default: "No"
    t.string   "reset_password_token"
    t.datetime "password_reset_sent_at"
    t.datetime "reset_password_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
