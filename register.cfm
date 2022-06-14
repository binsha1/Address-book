<cfparam name='status' default = "value" >
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
                        <h3 class="text-contact pt-5 text-center pb-3">SIGN UP</h3>                        
                        <cfif status EQ hash('2','sha')>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Email Already Exists!!
                            </div>
                        <cfelseif  status EQ hash('3','sha')>                               
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    User Name Already Exists!!
                            </div>
                        <cfelseif  status EQ hash('4','sha')>                               
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Please Fill Full Name!!
                            </div>
                        <cfelseif  status EQ hash('5','sha')>                               
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Please Fill Email Address!!
                            </div>
                        <cfelseif  status EQ hash('6','sha')>                               
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Please Fill User Name!!
                            </div>
                        <cfelseif  status EQ hash('7','sha')>                               
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Please Fill Password!!
                            </div>
                        <cfelseif  status EQ hash('8','sha')>                               
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Please Fill Confirm Password!!
                            </div>
                        <cfelseif  status EQ hash('9','sha')>                               
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Password and Confirm Password should be same!!
                            </div>                            
                        </cfif>                                            
                        <form method='post' name="img_form" action="components/results.cfc?method=registerAccount" class="pt-3">
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="text" class="form-control" name="full_name" placeholder="Enter Full Name" id="f_name" required>
                                </div>
                            </div>
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="email" class="form-control" name="email_id" placeholder="Enter Email Id" id="email_add" onchange="checkEmail();" required>
                                    <p class="reg_email text-danger pt-3"></p>
                                </div>
                            </div>
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="text" class="form-control" name="user_name" placeholder="Enter User Name" id="user_name" onchange="checkUserName();"  required>
                                    <p class="reg_user text-danger pt-3"></p>
                                </div>
                            </div>
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="password" class="form-control" name="pwd" placeholder="Enter Password" id="pwd" onchange="validatePasswordField();" required>
                                </div>
                            </div>
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="password" class="form-control" name="c_pwd" placeholder="Confirm Password" id="cpwd" onchange="validatePassword();"  required>
                                </div>
                            </div>          
                            <div class='form-group row pt-3'>        
                                <div class='col-sm-12 text-center pb-5'>
                                    <input type="submit" name="Submit"  value="Register" class="btn btn-contact" id="reg_btn">
                                </div>
                            </div>
                        </form>                       
                    </div>
                </div>
            </div>
        </div>
    </div>
<cfinclude  template="footer.cfm">