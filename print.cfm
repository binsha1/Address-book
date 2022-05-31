<cfparam  name="user_id" default="v">
<cfset data=createObject("component","components.results")>
<cfset doc_data=data.printFunc(user_id)>
<cfdocument  format="pdf">
    <cfoutput query="doc_data">
        #first_name#
    </cfoutput>
</cfdocument>
<cfprint type="pdf" source="data.pdf" printer="OneNote (Desktop)">

