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

ActiveRecord::Schema.define(version: 20181017140637) do

  create_table "domandes", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "servizi_id"
    t.index ["servizi_id"], name: "index_domandes_on_servizi_id"
    t.index ["user_id"], name: "index_domandes_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "servizi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["servizi_id"], name: "index_favorites_on_servizi_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recensionis", force: :cascade do |t|
    t.string "titolo"
    t.text "content"
    t.integer "votoservizio"
    t.integer "user_id"
    t.integer "servizi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["servizi_id"], name: "index_recensionis_on_servizi_id"
    t.index ["user_id"], name: "index_recensionis_on_user_id"
  end

  create_table "ricerches", force: :cascade do |t|
    t.string "testonome"
    t.string "testotipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "testoindirizzo"
  end

  create_table "servizi", force: :cascade do |t|
    t.text "descrizione"
    t.integer "user_id"
    t.string "indirizzo"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.index ["user_id", "created_at"], name: "index_servizi_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_servizi_on_user_id"
  end

  create_table "servizis", force: :cascade do |t|
    t.text "descrizione"
    t.integer "user_id"
    t.string "indirizzo"
    t.string "tipo"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "immagini"
    t.index ["user_id", "created_at"], name: "index_servizis_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_servizis_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "activation_token"
    t.integer "preferiti"
    t.index ["activation_token"], name: "index_users_on_activation_token"
  end

end
