  
<cfif structKeyExists(session,"sessionUser" )>
    <cfparam  name="create" default="v">
    <cfparam  name="delete" default="v">
    <cfparam  name="edit" default="v">
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
                             <cfoutput><a href="print.cfm?user_id=#session.sessionUser.user_id#"><i class="fa fa-print"></i></a></cfoutput>
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
                    <cfelseif delete EQ '1'>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                Contact Deleted Successfully!!
                        </div>
                    <cfelseif edit EQ '1'>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                Contact Edited Successfully!!
                        </div>
                    <cfelseif edit EQ '2'>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                             User with Email Id Already Exists!!
                        </div>
                    <cfelseif edit EQ '3'>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                             User with Phone Number Already Exists!!
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
                                                            <option value='Miss'>Miss</option>
                                                            <option value='Mrs' >Mrs</option>
                                                            <option value='Mr' >Mr</option>                                                                
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
                                                        <input type="text" name="street_name" class="form-control" placeholder="Enter Street Name" required>                                                                                                             
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
                                                        <input type="email" name="email_id" class="form-control" placeholder="Enter Email Id" required>                                                                                                             
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
                                        <th colspan="3"></th> 
                                                                                                             
                                    </tr>
                                </thead>
                                <tbody>
                                    <ORMReload()>
                                    <cfset data = EntityLoad("contacts")>
                                     
                                    <cfset json_data = serializeJSON(data )>

                        <cfset sData = deserializeJSON(json_data)>   
                                    <!---<cfset data=createObject("component","components.results")>
                                    <cfset res=data.contactData()> --->                              
                                    
                                    <cfoutput>
                                    <cfloop array="#sData#" index="i">
                                    
                                        <cfset name=i.first_name & " " & i.last_name>
                                        <cfset c_name= i.title & " " & i.first_name & " " & i.last_name>
                                        <cfset address_name= i.address & ", " & i.street_name & ", " & i.city & ", " & i.state & ", " & i.nation>
                                        <tr>
                                            <cfif i.user_photo NEQ "">
                                                <td><img src="uploads/#user_photo#" class="img-fluid img-icon"></td>
                                            <cfelseif i.user_photo EQ "" AND i.gender EQ "Male">
                                                <td><img src="files/male.png" class="img-fluid img-icon"></td>
                                            <cfelseif i.user_photo EQ "" AND i.gender EQ "Female">
                                                <td><img src="files/female.png" class="img-fluid img-icon"></td>
                                            </cfif>
                                            <td> #name# </td> 
                                            <td> #i.email_id# </td>
                                            <td> #i.phone_number# </td>  
                                            <td><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target=".editModal-#i.id#">Edit</button></td>
                                            <td><a href="delete.cfm?id=#i.id#" class="btn btn-contact">Delete</a></td>                                            
                                            <td><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target=".viewModal-#i.id#">View</button></td>
                                        </tr>
                                        <!---Edit Modal --->
                                        <div class="modal editModal-#i.id#">
                                            <div class="modal-dialog modal-lg">
                                            <form method='post' action="components/results.cfc?method=editContact" name="img_form" enctype='multipart/form-data' >
                                                <div class="modal-content">
                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h2 class="modal-title">Edit Contact </h2>
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
                                                                    <input name="contact_id" value="#i.id#" type="hidden">
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
                                                                    <input type="text" name="f_name" class="form-control" placeholder="Enter First Name" value="#i.first_name#" required>
                                                                </div>                                                                                                       
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-lg-2">
                                                                    <label class="form-label required control-label pt-3" >Last Name:</label>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <input type="text" name="l_name" class="form-control" placeholder="Enter Last Name" value="#i.last_name#" required>
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
                                                                    <input type="date" name="dob" class="form-control" placeholder="Enter Date Of Birth" value="#i.dob#" required>
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
                                                                    <input type="text" name="address" class="form-control" placeholder="Enter Address" value="#i.address#" required>
                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <label class="form-label required control-label pt-3" >Street Name:</label>
                                                                </div>
                                                                <div class="col-lg-4">                                                                                                                    
                                                                    <input type="text" name="street" class="form-control" placeholder="Enter Street Name" value="#i.street_name#"required>                                                                                                             
                                                                </div> 
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-lg-2">
                                                                        <label class="form-label required control-label pt-3" >City:</label>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <input type="text" name="city" class="form-control" placeholder="Enter City" value="#i.city#" required>
                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <label class="form-label required control-label pt-3" >State:</label>
                                                                </div>
                                                                <div class="col-lg-4">                                                                                                                    
                                                                    <input type="text" name="state" class="form-control" placeholder="Enter State" value="#i.state#" required>                                                                                                             
                                                                </div>                                                      
                                                            </div>                                               
                                                            <div class="form-group">
                                                                <div class="col-lg-2">
                                                                    <label class="form-label required control-label pt-3" >Nationality:</label>
                                                                </div>
                                                                <div class="col-lg-4">                                                                                                                    
                                                                    <input type="text" name="nation" class="form-control" placeholder="Enter Nationality" value="#i.nation#" required>                                                                                                             
                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <label class="form-label required control-label pt-3" >Pincode:</label>
                                                                </div>
                                                                <div class="col-lg-4">                                                                                                                    
                                                                    <input type="text" name="pincode" id="pincode" class="form-control"  placeholder="Enter Pincode" value="#i.pincode#" required >                                                                                                             
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-lg-2">
                                                                    <label class="form-label required control-label pt-3" >Email Id:</label>
                                                                </div>
                                                                <div class="col-lg-4">                                                                                                                    
                                                                    <input type="email" name="email" class="form-control" placeholder="Enter Email Id" value="#i.email_id#" required>                                                                                                             
                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <label class="form-label required control-label pt-3" >Phone Number:</label>
                                                                </div>
                                                                <div class="col-lg-4">                                                                                                                    
                                                                    <input type="text" name="phone" class="form-control" placeholder="Enter Phone Number" value="#i.phone_number#" required>                                                                                                             
                                                                </div>
                                                            </div>  
                                                        </div>                                                                                
                                                    </div>
                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <input type="submit" class="btn btn-contact" name="submit" value="Edit" onclick="validateCreate();">
                                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                </div>
                                        <!--- Edit Modal --->
                                        <!--- View Modal --->                                                              
                                        <!-- The Modal -->
                                        <div class="modal viewModal-#i.id#" >
                                            <div class="modal-dialog modal-lg">
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
                                                                        #c_name#
                                                                    </div>
                                                                </div>
                                                                <div class="row pt-3">
                                                                    <div class="col-lg-4">
                                                                        Gender: 
                                                                    </div>
                                                                    <div class="col-lg-8">
                                                                        #i.gender#
                                                                    </div>
                                                                </div>
                                                                <div class="row pt-3">
                                                                    <div class="col-lg-4">
                                                                        Date Of Birth:
                                                                    </div>
                                                                    <div class="col-lg-8">
                                                                        #i.dob#
                                                                    </div>
                                                                </div>
                                                                <div class="row pt-3">
                                                                    <div class="col-lg-4">
                                                                        Address:
                                                                    </div>
                                                                    <div class="col-lg-8">
                                                                        #address_name#
                                                                    </div>
                                                                </div>
                                                                <div class="row pt-3">
                                                                    <div class="col-lg-4">
                                                                        Pincode:
                                                                    </div>
                                                                    <div class="col-lg-8">
                                                                        #i.pincode#
                                                                    </div>
                                                                </div>
                                                                <div class="row pt-3">
                                                                    <div class="col-lg-4">
                                                                        Email Id
                                                                    </div>
                                                                    <div class="col-lg-8">
                                                                        #i.email_id#
                                                                    </div>
                                                                </div>
                                                                 <div class="row pt-3">
                                                                    <div class="col-lg-4">
                                                                        Phone Number
                                                                    </div>
                                                                    <div class="col-lg-8">
                                                                        #i.phone_number#
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-5">
                                                                <cfif i.user_photo NEQ "">
                                                                    <img src="uploads/#i.user_photo#" class="img-fluid img-pic">
                                                                </cfif>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!---View Modal ---> 
                                    
                                    
                                </tbody>
                                 </cfloop>
                            </cfoutput>
                            </table>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    </body>
    <cfinclude  template="footer.cfm">
<cfelse>
    <cflocation  url="index.cfm">
</cfif>
