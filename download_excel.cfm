<cfset data=application.obj.downloadPdf(session.sessionUser.user_id)>
<cfset res=queryNew("Name,Date_of_birth,Gender,Address,Pincode,Email,Phone")>
<cfoutput query="data">
    <cfset c_name= title & ". " & first_name & " " & last_name>
    <cfset address_name= address & ", " & street_name & ", " & city & ", " & state & ", " & nation>
    <cfset queryAddRow(res)>
	<cfset querySetCell(res, "Name", c_name)>
	<cfset querySetCell(res, "Date_Of_Birth", dateFormat('#dob#','dd-mm-yyyy'))>
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
Status Update	    :  07-06-2022
Working on 	    : Address Book- Task 2
Task   		    : Removes CFID, CFtoken values from url | Encrypting value passing through url |
				  Code Review
Task Completion : 95%
ETA                      : 06-06-2022
link                      : https://github.com/binsha1/Address-book.git