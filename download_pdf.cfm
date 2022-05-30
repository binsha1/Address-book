<cfparam  name="user_id" default="v">
<cfset s=createObject("component","components.results")>
<cfset data=s.downloadPdf(user_id)>

<cfheader name="Content-Disposition" value="attachment; filename=myDoc.pdf">

<cfcontent type="application/pdf">
<cfdocument  format="pdf">   
    
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
                    <td>#dob#</td>
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
