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

ActiveRecord::Schema.define(version: 20_190_905_083_449) do
  create_table 'carriages', force: :cascade do |t|
    t.string 'type_of_car'
    t.integer 'top_seats'
    t.integer 'lower_seats'
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
  end

  create_table 'routes', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tickets', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'current_train_id'
    t.integer 'first_railway_station_id'
    t.integer 'last_railway_station_id'
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
    t.index ['current_railway_station_id'], name: 'index_trains_on_current_railway_station_id'
    t.index ['railway_stations_id'], name: 'index_trains_on_railway_stations_id'
    t.index [nil], name: 'index_trains_on_current_route_id'
  end

  create_table 'trains_routes', force: :cascade do |t|
    t.integer 'train_id'
    t.integer 'route_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
