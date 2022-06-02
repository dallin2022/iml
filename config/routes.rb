Rails.application.routes.draw do

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

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

  # CUSTOMER-FACING FORM INPUT

  get("/", { :controller => "photos", :action => "input"})

  # CUSTOMER CONFIRMS THEIR INPUT
  
  post("/confirmation", { :controller => "photos", :action => "display"})

  # CUSTOMER IS NOTIFIED THAT THEIR INFORMATION WAS SUBMITTED, AND THEY'RE GIVEN OPTION TO TRY AGAIN

  post("/save", {:controller => "photos", :action => "save"})

  #------------------------------

end
