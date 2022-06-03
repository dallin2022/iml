Rails.application.routes.draw do

  # Routes for the Content resource:

  # CREATE
  post("/insert_content", { :controller => "contents", :action => "create" })
          
  # READ
  get("/contents", { :controller => "contents", :action => "index" })
  
  get("/contents/:path_id", { :controller => "contents", :action => "show" })
  
  # UPDATE
  
  post("/modify_content/:path_id", { :controller => "contents", :action => "update" })
  
  # DELETE
  get("/delete_content/:path_id", { :controller => "contents", :action => "destroy" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/customers", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------

  # Routes for customer-facing input resource:
  
  # CUSTOMER-FACING FORM INPUT

  get("/", { :controller => "input", :action => "input"})

  # CUSTOMER CONFIRMS THEIR INPUT
  
  post("/confirmation", { :controller => "input", :action => "display"})

  # CUSTOMER IS NOTIFIED THAT THEIR INFORMATION WAS SUBMITTED, AND THEY'RE GIVEN OPTION TO TRY AGAIN

  post("/save", {:controller => "input", :action => "save"})

  #------------------------------

end
