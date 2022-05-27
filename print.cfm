<cfparam  name="user_id" default="v">
<cfset data=createObject("component","components.results")>
<cfset doc_data=data.printFunc(user_id)>
<cfdocument name="contact.pdf" format="pdf">
    <cfoutput query="doc_data">
        #first_name#
    </cfoutput>
</cfdocument>
<!---<cfoutput>#getPrinterList()#
</cfoutput> --->
<cfprint type="pdf" source="contact.pdf" printer="Fax">