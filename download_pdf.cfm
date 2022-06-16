<cfset data=application.obj.printFunc()>
<cfdocument  format="pdf" filename="contact_data.pdf" overwrite="Yes"> 
    <cfinclude  template="master.cfm">
    <h3 class="text-center">Contact List</h3>
    <table class="table table-bordered">
        <thead>
            <tr>                
                <th>Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Pincode</th>
                <th>Email</th>
                <th>Phone</th>
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
<cfheader name="Content-Disposition" value="attachment;filename=contact_data.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\contact_data.pdf" deletefile="Yes">


