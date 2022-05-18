<cfinclude  template="master.cfm">
<body>
    <div class="container-fluid">
        <div class="container py-5">
            <div class="col-lg-6 offset-lg-3 p-3">
                <div class="row bg-form">
                    <div class="col-lg-4 p-2">
                        <div class="bg-theme">
                        </div>
                    </div>
                    <div class="col-lg-8 left-div">
                        <form method='post' name="img_form" action="">
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
                        <div>
                            <p>Or Sign In using</p>
                            <i class="fa fa-facebook-square"></i>
                            <i class="fa fa-google-plus"></i> 
                        </div>
                        <div>
                            <p>Dont have any account? <a href=""><span class="text-contact">Register Here</span></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>