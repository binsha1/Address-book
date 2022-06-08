<cfif structKeyExists(session,"sessionUser" )>
    <cfparam  name="status" default="v">    
    <cfinclude  template="header.cfm">
        <div class="container-fluid">
            <div class="container">
                <div class="row pt-3 pdf_row">
                    <div class="col-md-12">
                        <h3 class="text-contact">WELCOME</h3>
                        <div class="dashboard_icons">
                           <p>
                                <cfoutput><a href="download_pdf.cfm"><i class="fa fa-file-pdf-o"></i></a></cfoutput>
                                <cfoutput><a href="download_excel.cfm"><i class="fa fa-file-excel-o"></i></a></cfoutput>
                                <cfoutput><a href="print.cfm"><i class="fa fa-print"></i></a></cfoutput>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row pt-5">
                    <!---<cfif create EQ '2'>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                User with Email Id Already Exists!!
                        </div>
                    <cfelseif  create EQ '3'>                               
                        <div class="alert alert-danger alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                User with Phone Number Already Exists!!
                        </div>--->
                    <cfif status EQ hash('1','sha')>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                Contact Created Successfully!!
                        </div>
                    <cfelseif status EQ hash('3','sha')>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                Contact Deleted Successfully!!
                        </div>
                    <cfelseif status EQ hash('2','sha')>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                Contact Edited Successfully!!
                        </div>
                        <!---
                    <cfelseif edit EQ '2'>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                             User with Email Id Already Exists!!
                        </div>
                    <cfelseif edit EQ '3'>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                             User with Phone Number Already Exists!!
                        </div>--->
                    </cfif>                    
                    <div class="col-md-4">
                        <div class="contact-card text-center">
                            <div class="contact-image">
                                <img src="files/user_image.png" class="img-fluid img-contact">
                            </div>
                            <h3 class="text-uppercase"><cfoutput>#session.sessionUser.full_name#</cfoutput></h3>
                            <button type="button" class="btn btn-contact create title" data-bs-toggle="modal" data-bs-target=".myModal" data-id="0" >Create Contact</button>
                        </div>
                        
                    </div>
                    <div class="col-md-8">
                        <div class="table-div" id="tableView">                               
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Email Id</th>
                                        <th>Phone Number</th> 
                                        <th colspan="3"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <ORMReload()>
                                    <cfset data = EntityLoad("contacts",{user_id="#session.sessionUser.user_id#"})>                                     
                                    <cfset json_data = serializeJSON(data )>
                                    <cfset sData = deserializeJSON(json_data)>                                    
                                    <cfoutput>
                                    <cfif ArrayLen(sData) GT 0>
                                        <cfloop array="#sData#" index="i">                                    
                                            <cfset name=i.first_name & " " & i.last_name>
                                            <cfset c_name= i.title & " " & i.first_name & " " & i.last_name>
                                            <cfset address_name= i.address & ", " & i.street_name & ", " & i.city & ", " & i.state & ", " & i.nation>
                                            <tr>
                                                <cfif i.user_photo NEQ "">
                                                    <td><img src="uploads/#i.user_photo#" class="img-fluid img-icon"></td>
                                                <cfelseif i.user_photo EQ "" AND i.gender EQ "Male">
                                                    <td><img src="files/male.png" class="img-fluid img-icon"></td>
                                                <cfelseif i.user_photo EQ "" AND i.gender EQ "Female">
                                                    <td><img src="files/female.png" class="img-fluid img-icon"></td>
                                                </cfif>
                                                <td> #name# </td> 
                                                <td> #i.email_id# </td>
                                                <td> #i.phone_number# </td>  
                                                <td><button class="btn btn-primary edit title" data-bs-toggle="modal" data-bs-target=".myModal" data-id="#i.id#" id="edit">Edit</button></td>
                                                <td><a href="delete.cfm?id=#i.id#&user_id=#session.sessionUser.user_id#" class="btn btn-contact">Delete</a></td>                                            
                                                <td><button class="btn btn-primary view" data-bs-toggle="modal" data-bs-target=".viewModal" data-id="#i.id#">View</button></td>
                                            </tr>
                                        
                        <!---Create Modal--->                                        
                                        <!--- View Modal --->                                                              
                                        <!-- The Modal -->
                                        <div class="modal viewModal" >
                                            <div class="modal-dialog modal-lg" >
                                                <div class="modal-content">
                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                    <h4 class="modal-title">User Details</h4>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body p-5">
                                                    <div class="row">
                                                        <div class="col-lg-7">
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    Name: 
                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <p id="full_name"></p>
                                                                </div>
                                                            </div>
                                                            <div class="row pt-3">
                                                                <div class="col-lg-4">
                                                                    Gender: 
                                                                </div>
                                                                <div class="col-lg-8">
                                                                   <p id="gender"></p>
                                                                </div>
                                                            </div>
                                                            <div class="row pt-3">
                                                                <div class="col-lg-4">
                                                                    Date Of Birth:
                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <p id="d_birth"></p>
                                                                </div>
                                                            </div>
                                                            <div class="row pt-3">
                                                                <div class="col-lg-4">
                                                                    Address:
                                                                </div>
                                                                <div class="col-lg-8">
                                                                   <p id="addr"></p>
                                                                </div>
                                                            </div>
                                                            <div class="row pt-3">
                                                                <div class="col-lg-4">
                                                                    Pincode:
                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <p id="pin"></p>
                                                                </div>
                                                            </div>
                                                            <div class="row pt-3">
                                                                <div class="col-lg-4">
                                                                    Email Id
                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <p id="email"></p>
                                                                </div>
                                                            </div>
                                                            <div class="row pt-3">
                                                                <div class="col-lg-4">
                                                                    Phone Number
                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <p id="phone"></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-5">
                                                            <p id="user_img"></p>
                                                            <!---<cfif i.user_photo NEQ "">
                                                                <img src="uploads/#i.user_photo#" class="img-fluid img-pic">
                                                            </cfif>--->
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>                                
                                        <!---View Modal --->                                 
                                    </tbody>
                                </cfloop>
                            <cfelse>
                                <tr><td colspan="7" class="text-center">No Listings</td></tr>
                            </cfif>
                        </cfoutput>
                    </table>                           
                </div>
            </div>
        </div>
         <!--Create Modal -->                        
                        <div class="modal myModal" >
                            <div class="modal-dialog modal-lg">
                                <form method='post' action="" name="img_form" id="formId" enctype='multipart/form-data' >
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h2 class="modal-title"id="modal_title"> </h2>
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
                                                            <input name="contact_id" id="contact_id" type="hidden">
                                                        </cfoutput>
                                                        <select name='title' class='form-control' id="title" required>
                                                            <option value="">Select Title</option>
                                                            <option value='Miss'>Miss</option>
                                                            <option value='Mrs' >Mrs</option>
                                                            <option value='Mr' >Mr</option>                                                                
                                                        </select> 
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >First Name:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <input type="text" name="f_name" class="form-control" id="f_name" placeholder="Enter First Name" value="" required>
                                                    </div>                                                                                                       
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Last Name:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <input type="text" name="l_name" class="form-control" placeholder="Enter Last Name" id="l_name" required>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label" >Gender:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="form-check form-check-inline">
                                                            <input type="radio" name="gender" value="Male" class="form-check-input" required>
                                                            <label class="form-check-label">Male</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input type="radio" name="gender" value="Female" class="form-check-input" required>
                                                            <label class="form-check-label">Female</label>
                                                        </div>                                                        
                                                    </div>                                                    
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Date Of Birth:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <input type="date" name="dob" class="form-control" placeholder="Enter Date Of Birth" id="dob" required>
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
                                                        <input type="text" name="address" class="form-control" placeholder="Enter Address" id="address" required>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Street Name:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="street_name" class="form-control" placeholder="Enter Street Name" id="street" required>                                                                                                             
                                                    </div> 
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                            <label class="form-label required control-label pt-3" >City:</label>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <input type="text" name="city" class="form-control" placeholder="Enter City" id="city" required>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >State:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="state" class="form-control" placeholder="Enter State" id="state" required>                                                                                                             
                                                    </div>                                                      
                                                </div>                                               
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Nationality:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="nation" class="form-control" placeholder="Enter Nationality" id="nation" required>                                                                                                             
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Pincode:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="pincode"  class="form-control"  placeholder="Enter Pincode" id="pincode" required >                                                                                                             
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Email Id:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="email" name="email_id" class="form-control" placeholder="Enter Email Id" id="email_id" onchange="validateEmail();" required>                                                                                                             
                                                        <p class="email_alert text-danger"></p>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <label class="form-label required control-label pt-3" >Phone Number:</label>
                                                    </div>
                                                    <div class="col-lg-4">                                                                                                                    
                                                        <input type="text" name="phone" class="form-control" placeholder="Enter Phone Number" id="phone" onchange="validatePhone();" required>                                                                                                             
                                                        <p class="phone_alert text-danger"></p>
                                                    </div>
                                                </div>  
                                            </div>                                                                                
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-contact" name="submit" value="Submit" id="sub_btn" onclick="validateCreate();">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div> 
<cfinclude  template="footer.cfm">
<cfelse>
    <cflocation  url="index.cfm" addtoken="no">
</cfif>
