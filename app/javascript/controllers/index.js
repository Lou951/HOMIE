// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddProductController from "./add_product_controller"
application.register("add-product", AddProductController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import InsertListController from "./insert_list_controller"
application.register("insert-list", InsertListController)

import SearchBarController from "./search_bar_controller"
application.register("search-bar", SearchBarController)

import TomSelectController from "./tom_select_controller"
application.register("tom-select", TomSelectController)
