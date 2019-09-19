# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_918_090_650) do
  create_table 'carriages', force: :cascade do |t|
    t.integer 'number'
    t.integer 'top_seats'
    t.integer 'lower_seats'
    t.integer 'side_top_seats'
    t.integer 'side_lower_seats'
    t.string 'type'
    t.integer 'train_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['train_id'], name: 'index_carriages_on_train_id'
  end

  create_table 'railway_stations', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'railway_stations_routes', force: :cascade do |t|
    t.integer 'railway_station_id'
    t.integer 'route_id'
    t.integer 'station_index'
    t.integer 'position'
    t.time 'arrival'
    t.time 'departure'
  end

  create_table 'routes', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tickets', force: :cascade do |t|
    t.string 'number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'current_train_id'
    t.integer 'first_railway_station_id'
    t.integer 'last_railway_station_id'
    t.string 'user_name'
    t.string 'passport_data'
    t.integer 'user_id'
    t.index ['current_train_id'], name: 'index_tickets_on_current_train_id'
    t.index ['first_railway_station_id'], name: 'index_tickets_on_first_railway_station_id'
    t.index ['last_railway_station_id'], name: 'index_tickets_on_last_railway_station_id'
  end

  create_table 'trains', force: :cascade do |t|
    t.string 'number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'railway_stations_id'
    t.integer 'current_railway_station_id'
    t.integer 'route_id'
    t.boolean 'order_carriage', default: false
    t.index ['current_railway_station_id'], name: 'index_trains_on_current_railway_station_id'
    t.index ['railway_stations_id'], name: 'index_trains_on_railway_stations_id'
  end

  create_table 'trains_routes', force: :cascade do |t|
    t.integer 'train_id'
    t.integer 'route_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.boolean 'admin', default: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
