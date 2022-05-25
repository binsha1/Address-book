<cfcomponent output="false">
    <cfset this.name="cf_tasks">
    <cfset this.sessionManagement = true />
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)/>
    <cfset This.applicationtimeout=createTimespan(2,0,0,0)>   
    <cfset this.setClientCookies=false>
    <cfset this.scriptProtect="all">
    <cfset this.ormenabled="true"> 
    <cfset this.datasource="address_book">
</cfcomponent>