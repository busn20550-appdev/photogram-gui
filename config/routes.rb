Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })


  get("/users", { :controller => "users", :action => "index" })
  get("/users/:name", { :controller => "users", :action => "show" })
  get("/add_user", { :controller => "users", :action => "add" })
  get("/update_user/:name", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:id", { :controller => "photos", :action => "del" })

  get("/insert_photo", { :controller => "photos", :action => "input" })
  get("/update_photo/:id", { :controller => "photos", :action => "update" })

  get("/add_comment", { :controller => "photos", :action => "comment" })

end
