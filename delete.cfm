    <cfparam  name="id" default="v">
    <cfset data=createObject("component","components.results")>
    <cfset del=data.deleteData(id)>
    <cfif del EQ "1">
            <cflocation  url="dashboard.cfm?delete=1" addtoken="no">
    </cfif>

