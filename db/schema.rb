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

ActiveRecord::Schema.define(version: 20161211151846) do

  create_table "blogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                       null: false
    t.text     "description",   limit: 65535,                 null: false
    t.boolean  "is_closed",                   default: false, null: false
    t.integer  "restaurant_id",                               null: false
    t.integer  "user_id",                                     null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["restaurant_id"], name: "index_blogs_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_blogs_on_user_id", using: :btree
  end

  create_table "command_menus", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "command_id", null: false
    t.integer  "menu_id",    null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["command_id"], name: "index_command_menus_on_command_id", using: :btree
    t.index ["menu_id"], name: "index_command_menus_on_menu_id", using: :btree
  end

  create_table "command_products", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "command_id", null: false
    t.integer  "product_id", null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["command_id"], name: "index_command_products_on_command_id", using: :btree
    t.index ["product_id"], name: "index_command_products_on_product_id", using: :btree
  end

  create_table "commands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                 null: false
    t.integer  "location_id",                           null: false
    t.integer  "user_id",                               null: false
    t.text     "description", limit: 65535
    t.integer  "is_end",                    default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["location_id"], name: "index_commands_on_location_id", using: :btree
    t.index ["user_id"], name: "index_commands_on_user_id", using: :btree
  end

  create_table "incidences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category",                                null: false
    t.integer  "priority",                                null: false
    t.string   "title",                                   null: false
    t.text     "description",   limit: 65535,             null: false
    t.integer  "is_solved",                   default: 0, null: false
    t.datetime "date_start",                              null: false
    t.datetime "date_solution"
    t.integer  "restaurant_id",                           null: false
    t.integer  "user_id",                                 null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["restaurant_id"], name: "index_incidences_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_incidences_on_user_id", using: :btree
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "place",                                        null: false
    t.integer  "sit",                                          null: false
    t.float    "total_price_command", limit: 24, default: 0.0, null: false
    t.integer  "restaurant_id",                                null: false
    t.integer  "user_id",                                      null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["restaurant_id"], name: "index_locations_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
  end

  create_table "menu_products", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "menu_id",    null: false
    t.integer  "product_id", null: false
    t.integer  "category",   null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_products_on_menu_id", using: :btree
    t.index ["product_id"], name: "index_menu_products_on_product_id", using: :btree
  end

  create_table "menus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                        null: false
    t.integer  "type_menu",                   null: false
    t.float    "price",         limit: 24,    null: false
    t.text     "description",   limit: 65535, null: false
    t.integer  "restaurant_id",               null: false
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_menus_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "subject",                               null: false
    t.text     "description", limit: 65535,             null: false
    t.integer  "is_view",                   default: 0, null: false
    t.string   "user_for",                              null: false
    t.string   "user_from",                             null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                     null: false
    t.integer  "product_type",             null: false
    t.string   "description"
    t.float    "unit_price",    limit: 24, null: false
    t.integer  "restaurant_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["restaurant_id"], name: "index_products_on_restaurant_id", using: :btree
  end

  create_table "products_takeaway", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "takeaway_id", null: false
    t.integer  "product_id",  null: false
    t.integer  "quantity",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_products_takeaway_on_product_id", using: :btree
    t.index ["takeaway_id"], name: "index_products_takeaway_on_takeaway_id", using: :btree
  end

  create_table "questionnaires", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "question",            null: false
    t.integer  "restaurant_id"
    t.datetime "remember_created_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["restaurant_id"], name: "index_questionnaires_on_restaurant_id", using: :btree
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          null: false
    t.integer  "num_persons",   null: false
    t.date     "date",          null: false
    t.time     "hour",          null: false
    t.integer  "phone"
    t.integer  "restaurant_id", null: false
    t.integer  "user_id"
    t.integer  "menu_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["menu_id"], name: "index_reservations_on_menu_id", using: :btree
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "restaurant_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                                null: false
    t.integer  "restaurant_id",                          null: false
    t.integer  "rol"
    t.float    "discount",      limit: 24, default: 0.0, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["restaurant_id"], name: "index_restaurant_users_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_restaurant_users_on_user_id", using: :btree
  end

  create_table "restaurants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          null: false
    t.integer  "phone",         null: false
    t.string   "address",       null: false
    t.string   "city",          null: false
    t.string   "country",       null: false
    t.integer  "postal_code",   null: false
    t.string   "email",         null: false
    t.string   "opening_hours"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["email"], name: "index_restaurants_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_restaurants_on_name", unique: true, using: :btree
  end

  create_table "stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "quantity",                        null: false
    t.text     "description_stock", limit: 65535
    t.float    "price_buy_unity",   limit: 24,    null: false
    t.integer  "product_id",                      null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["product_id"], name: "index_stocks_on_product_id", using: :btree
  end

  create_table "takeaways", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                             null: false
    t.date     "date",                             null: false
    t.time     "hour",                             null: false
    t.integer  "phone"
    t.float    "total_price_selection", limit: 24
    t.integer  "restaurant_id",                    null: false
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["restaurant_id"], name: "index_takeaways_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_takeaways_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                              default: "",    null: false
    t.string   "encrypted_password",                 default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "phone"
    t.string   "user_name"
    t.date     "birth_date",                                         null: false
    t.integer  "current_user_restaurant"
    t.float    "total_spent",             limit: 24, default: 0.0,   null: false
    t.boolean  "superadmin",                         default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "answer",              null: false
    t.integer  "restaurant_id"
    t.integer  "questionnaire_id"
    t.datetime "remember_created_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["questionnaire_id"], name: "index_votings_on_questionnaire_id", using: :btree
    t.index ["restaurant_id"], name: "index_votings_on_restaurant_id", using: :btree
  end

end
