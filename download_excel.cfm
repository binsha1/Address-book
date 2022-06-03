<cfparam  name="user_id" default="v">

<cfset data=application.obj.downloadPdf(user_id)>
<cfset res=queryNew("Name,Date_of_birth,Gender,Address,Pincode,Email,Phone")>
<cfoutput query="data">
    <cfset c_name= title & ". " & first_name & " " & last_name>
    <cfset address_name= address & ", " & street_name & ", " & city & ", " & state & ", " & nation>
    <cfset queryAddRow(res)>
	<cfset querySetCell(res, "Name", c_name)>
	<cfset querySetCell(res, "Date_Of_Birth", dob)>
	<cfset querySetCell(res, "Gender", gender)>
	<cfset querySetCell(res, "Address", address_name)>
    <cfset querySetCell(res, "Pincode", pincode)>
	<cfset querySetCell(res, "Email", email_id)>
	<cfset querySetCell(res, "Phone", phone_number)>
</cfoutput>
<cfset filename = expandPath("./contact_list.xls")>
<cfset s = spreadsheetNew()>
<cfset spreadsheetAddRow(s, "Name,Date of birth,Gender,Address,Pincode,Email,Phone")>
<cfset spreadsheetFormatRow(s,
			{
				bold=true,
				fontsize=10
			}, 
			1)>
<cfset spreadsheetAddRows(s, res)>
<cfheader name="content-disposition" value="attachment; filename=contact_list.xls">
<cfcontent type="application/msexcel" variable="#spreadsheetReadBinary(s)#" reset="true">
<!---
<cfset theFile=GetDirectoryFromPath(GetCurrentTemplatePath()) & "contacts.xls">
<cfheader name="Content-Disposition" value="attachment; filename=contact_list.xls">

<cfcontent type="application/vnd.msexcel">
<!---   
<cfspreadsheet acton="write" filename="#theFile#" name="theSheet" sheetname="mock_data" overwrite=true> 
 ---->
        <table >
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
            
  
    
   
---->
