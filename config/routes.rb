Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })


  get("/users", { :controller => "users", :action => "index" })
  get("/users/:name", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:id", { :controller => "photos", :action => "del" })


end
