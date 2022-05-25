<cfif structKeyExists(session,"sessionUser" )>
    <cfparam  name="create" default="v">
    <cfinclude  template="master.cfm">
    <body>
        <cfinclude  template="header.cfm">
        <div class="container-fluid">
            <div class="container">
                <div class="row pt-3 pdf_row">
                    <div class="col-md-12">
                        <h3 class="text-contact">WELCOME</h3>
                        <div class="dashboard_icons">
                           <p> <i class="fa fa-file-pdf-o"></i>
                             <i class="fa fa-file-excel-o"></i>
                             <i class="fa fa-print"></i>
                             </p>
                        </div>
                    </div>
                </div>
                <div class="row pt-5">
                    <cfif create EQ '2'>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                User with Email Id Already Exists!!
                        </div>
                    <cfelseif  create EQ '3'>                               
                        <div class="alert alert-danger alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                User with Phone Number Already Exists!!
                        </div>
                    <cfelseif create EQ '1'>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                Contact Created Successfully!!
                        </div>
                    </cfif>                    
                    <div class="col-md-4">
                        <div class="contact-card text-center">
                            <div class="contact-image">
                                <img src="files/user_image.png" class="img-fluid img-contact">
                            </div>
                            <h3 class="text-uppercase"><cfoutput>#session.sessionUser.full_name#</cfoutput></h3>
                            <button type="button" class="btn btn-contact" data-bs-toggle="modal" data-bs-target="#myModal">Create Contact</button>
                        </div>
                        <!-- Modal -->
                        <div class="modal" id="myModal">
                            <div class="modal-dialog modal-lg">
                                <form method='post' action="components/results.cfc?method=createContact" name="img_form" enctype='multipart/form-data' >
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h2 class="modal-title">CREATE CONTACT </h2>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <h3 class="text-left text-contact">Personal Details</h3>
                                            <hr>
                                            <div class='row justify-content-center'>                                                   
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                        <label  class="form-label required control-label pt-3" >Title:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <cfoutput>
                                                        <input type="hidden" name="user_id" value="#session.sessionUser.user_id#">
                                                        </cfoutput>
                                                        <select name='title' class='form-control' id="title" required>
                                                            <option value="">Select Title</option>
                                                            <option value='miss'>Miss</option>
                                                            <option value='mrs' >Mrs</option>
                                                            <option value='mr' >Mr</option>                                                                
                                                        </select> 
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >First Name:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <input type="text" name="f_name" class="form-control" placeholder="Enter First Name" required>
                                                    </div>                                                                                                       
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Last Name:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <input type="text" name="l_name" class="form-control" placeholder="Enter Last Name" required>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label" >Gender:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="form-check form-check-inline">
                                                            <input type="radio" name="gender" value="Male" class="form-check-input">
                                                            <label class="form-check-label">Male</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="radio" name="gender" value="Female" class="form-check-input">
                                                            <label class="form-check-label">Female</label>
                                                        </div>                                                        
                                                    </div>                                                    
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Date Of Birth:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <input type="date" name="dob" class="form-control" placeholder="Enter Date Of Birth" required>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label control-label pt-3" >Upload Photo:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div>                                                           
                                                            <input class="form-control form-control-lg" id="formFileLg" type="file" accept=".png,.jpg,.jpeg" name="user_img">
                                                        </div>                                                      
                                                    </div>                                                    
                                                </div>
                                            </div>
                                            <h3 class="text-left text-contact">Contact Details</h3>
                                            <hr>
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                            <label class="form-label required control-label pt-3" >Address:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <input type="text" name="address" class="form-control" placeholder="Enter Address" required>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Street Name:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="street" class="form-control" placeholder="Enter Street Name" required>                                                                                                             
                                                    </div> 
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                            <label class="form-label required control-label pt-3" >City:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <input type="text" name="city" class="form-control" placeholder="Enter City" required>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >State:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="state" class="form-control" placeholder="Enter State" required>                                                                                                             
                                                    </div>                                                      
                                                </div>                                               
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Nationality:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="nation" class="form-control" placeholder="Enter Nationality" required>                                                                                                             
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Pincode:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="pincode" id="pincode" class="form-control"  placeholder="Enter Pincode"  required >                                                                                                             
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Email Id:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="email" name="email" class="form-control" placeholder="Enter Email Id" required>                                                                                                             
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Phone Number:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="phone" class="form-control" placeholder="Enter Phone Number" required>                                                                                                             
                                                    </div>
                                                </div>  
                                            </div>                                                                                
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-contact" name="submit" value="Create" onclick="validateCreate();">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="table-div">                               
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Email Id</th>
                                        <th>Phone Number</th> 
                                        <th></th> 
                                        <th></th> 
                                        <th></th>                                                                      
                                    </tr>
                                </thead>
                                <tbody>                                    
                                       <!---<cfset data = EntityLoad("contacts")>
                                       <cfdump var="#data#">   --->
                                    <cfset data=createObject("component","components.results")>
                                    <cfset res=data.contactData()>                                 
                                    
                                    <cfoutput query='res'>
                                        <cfset name=first_name & " " & last_name>
                                        <tr>
                                            <cfif user_photo NEQ "">
                                                <td><img src="uploads/#user_photo#" class="img-fluid img-icon"></td>
                                            <cfelseif user_photo EQ "" AND gender EQ "Male">
                                                <td><img src="files/male.png" class="img-fluid img-icon"></td>
                                            <cfelseif user_photo EQ "" AND gender EQ "Female">
                                                <td><img src="files/female.png" class="img-fluid img-icon"></td>
                                            </cfif>
                                            <td> #name# </td> 
                                            <td> #email_id# </td>
                                            <td> #phone_number# </td>  
                                            <td><a href="" class="btn btn-contact">Edit</a></td>
                                            <td><a href="" class="btn btn-contact">Delete</a></td>
                                            <td><a href="" class="btn btn-contact">View</a></td>
                                        </tr>
                                    </cfoutput>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <cfinclude  template="footer.cfm">
<!---<cfelse>
    <cflocation  url="index.cfm">--->
</cfif>
