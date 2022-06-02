Rails.application.routes.draw do

  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------

get("/new_customization_form", { :controller => "photos", :action => "input"})

post("/confirmation", { :controller => "photos", :action => "display"})

post("/save", {:controller => "photos", :action => "save"})

 # Routes for the Videos resource:

  # CREATE
  post("/insert_video", { :controller => "videos", :action => "create" })
          
  # READ
  get("/videos", { :controller => "videos", :action => "index" })
  
  get("/videos/:path_id", { :controller => "videos", :action => "show" })
  
  # UPDATE
  
  post("/modify_video/:path_id", { :controller => "videos", :action => "update" })
  
  # DELETE
  get("/delete_video/:path_id", { :controller => "videos", :action => "destroy" })

  #------------------------------

end
