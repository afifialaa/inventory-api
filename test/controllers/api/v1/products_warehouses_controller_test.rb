require "test_helper"

describe ProductsWarehousesController do
  it "must get index" do
    get products_warehouses_index_url
    must_respond_with :success
  end

  it "must get create" do
    get products_warehouses_create_url
    must_respond_with :success
  end

  it "must get show" do
    get products_warehouses_show_url
    must_respond_with :success
  end

  it "must get update" do
    get products_warehouses_update_url
    must_respond_with :success
  end

  it "must get delete" do
    get products_warehouses_delete_url
    must_respond_with :success
  end

  it "must get move" do
    get products_warehouses_move_url
    must_respond_with :success
  end

end
