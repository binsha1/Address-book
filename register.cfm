<cfparam name='status' default = "value" >
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
                        <h3 class="text-contact pt-5 text-center pb-3">SIGN UP</h3>
                        <cfif status EQ '2'>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Email Already Exists!!
                            </div>
                        <cfelseif  status EQ '3'>                               
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    User Name Already Exists!!
                            </div>
                        <cfelseif status EQ '1'>
                            <div class="alert alert-success alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        Registered Successfully!!
                            </div>
                        </cfif>
                        <form method='post' name="img_form" action="components/results.cfc?method=registerAccount" class="pt-3">
                        <h3 class="text-contact pt-5 text-center">SIGN UP</h3>                        
                        <form method='post' name="img_form" action="components/results.cfc?method=registerAccount" class="pt-5">
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="text" class="form-control" name="full_name" placeholder="Enter Full Name" id="f_name" required="yes">
                                </div>
                            </div>
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="email" class="form-control" name="email_id" placeholder="Enter Email Id" id="email_id" required="yes">
                                </div>
                            </div>
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="text" class="form-control" name="user_name" placeholder="Enter User Name" id="user_name" required="yes">
                                </div>
                            </div>
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="password" class="form-control" name="pwd" placeholder="Enter Password" id="pwd" required="yes" onchange="validatePasswordField();">
                                </div>
                            </div>
                            <div class="form-group row">                                    
                                <div class='col-sm-12'>
                                    <input type="password" class="form-control" name="c_pwd" placeholder="Confirm Password" id="cpwd"  required="yes" onchange="validatePassword();">
                                </div>
                            </div>          
                            <div class='form-group row pt-3'>        
                                <div class='col-sm-12 text-center pb-5'>
                                    <input type="submit" name="Submit"  value="Register" class="btn btn-contact" >
                                </div>
                            </div>
                        </form>                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<cfinclude  template="footer.cfm">