<cfparam  name="invalid" default="val">
<cfinclude  template="master.cfm">
<body>
    <cfinclude  template="header.cfm">
    <div class="container-fluid">
        <div class="container py-5">
            <div class="col-lg-6 offset-lg-3 p-3">                
                <div class="row bg-form">                
                    <div class="col-lg-4 p-2">
                        <div class="bg-theme">
                        </div>
                    </div>
                    <div class="col-lg-8">
<<<<<<< HEAD
                        <h3 class="text-contact pt-5 text-center pb-3">LOGIN FORM</h3>
                        <cfif invalid EQ '1'>                                                
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                     Invalid Credentials!!
                            </div>
                        </cfif>
                        <form method='post' name="img_form" action="components/results.cfc?method=doLogin" class="pt-3">
=======
                        <h3 class="text-contact pt-5 text-center">LOGIN FORM</h3>                        
                        <form method='post' name="img_form" action="" class="pt-5">
>>>>>>> c18831ff2897ed82a2a5bda8f318d2ffd51224c3
                              <div class="form-group row">                                    
                                    <div class='col-sm-12'>
                                          <input type="text" class="form-control" name="user_name" placeholder="Enter User Name" id="f_name" required="yes">
                                    </div>
                              </div>
                              <div class="form-group row pt-3">                                    
                                    <div class='col-sm-12'>
                                          <input type="password" class="form-control" name="pwd" placeholder="Enter Password"  required="yes">
                                    </div>
                              </div>          
                              <div class='form-group row pt-3'>        
                                    <div class='col-sm-12'>
                                          <input type="submit" name="Submit"  value="Login " class="btn btn-contact" >
                                    </div>
                              </div>
                        </form>
                        <div class="py-3 ">
                            <p>Or Sign In using</p>
                            <div>
                                <i class="fa fa-facebook-square pr-5"></i>
                                <i class="fa fa-google-plus"></i> 
                            </div>
                        </div>
                        <div class="py-4">
                            <p>Dont have any account? <a href="register.cfm"><span class="text-contact">Register Here</span></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>