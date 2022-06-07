<cfset data=application.obj.downloadPdf(session.sessionUser.user_id)>
<cfdocument  format="pdf" filename="contact_data.pdf" overwrite="Yes"> 
    <cfinclude  template="master.cfm">
        <h3 class="text-center">Contact List</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Date Of Birth</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Pincode</th>
                    <th>Email Id</th>
                    <th>Phone Number</th>
                </tr>
            </thead>
            <cfoutput query="data">
            <tbody>                
                <cfset c_name= title & ". " & first_name & " " & last_name>
                <cfset address_name= address & ", " & street_name & ", " & city & ", " & state & ", " & nation>
                <tr>                    
                    <td>#c_name#</td>
                    <td>#dateFormat('#dob#','dd-mm-yyyy')#</td>
                    <td>#gender#</td>
                    <td>#address_name#</td>
                    <td>#pincode#</td>
                    <td>#email_id#</td>
                    <td>#phone_number#</td>
                </tr>
            </tbody>
             </cfoutput>
        </table>
</cfdocument>
<!---
<cfpdf action="removewatermark" source="#expandPath('.')#\contact_data.pdf" />
<cfpdf action="read" name="mypdf" source="#expandPath('.')#\contact_data.pdf" />	
<cfcontent variable="#toBinary(mypdf)#" type="application/pdf" />	 --->
<cfheader name="Content-Disposition" value="attachment;filename=contact_data.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\contact_data.pdf" deletefile="Yes">
<cfpdf action="removewatermark" source="#expandPath('.')#\contact_data.pdf" />
<cfpdf action="read" name="mypdf" source="#expandPath('.')#\contact_data.pdf" />	
<cfcontent variable="#toBinary(mypdf)#" type="application/pdf" />
