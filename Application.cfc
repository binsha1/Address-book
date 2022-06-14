<cfcomponent output="false">
    <cfset this.name="cf_tasks">
    <cfset this.sessionManagement = "true" >
    <cfset this.sessionTimeout = createTimespan(0,0,0,30)>
    <cfset This.applicationtimeout=createTimespan(2,0,0,0)> 
    <cfset this.clientManagement="true">
    <cfset this.setClientCookies=true>
    <cfset this.scriptProtect="all">    
    <cfset this.ormenabled="true">
    <cfset this.loginStorage = "session"> 
    <cfset this.datasource="address_book">
    <cfset this.ormSettings = { 
        logsql : true,
        cflocation : ['components/contacts'],
        dbcreate : "none",  
        dialect : "org.hibernate.dialect.MySQL5Dialect",
        datasource : "address_book",
        useDBForMapping : false
    }>

    <!---OnApplicationStart Method--->
    <cffunction name="OnApplicationStart" returntype="boolean" access="public">
        <cfset application.obj=createObject('component','components.results')>
        <cfreturn true>
    </cffunction>

    

    <cffunction name="onSessionStart" returnType="void" output="false" access="public">
        <cfset session.started = now()>
        <cfset session.loggedin=false>
                          
    </cffunction>
    <!---OnRequestStart Method--->
    <cffunction name="OnRequestStart" returntype="boolean" access="public">       
        <cfargument name="targetPage" type="string" required="true" />
        <cfif !session.loggedin>
           <cflocation  url="index.cfm" addtoken="no">            
        <cfelse>
            <cfset this.onApplicationStart()>             
        </cfif>
        
        <cfreturn true>
    </cffunction>
    
    <cffunction name="onSessionEnd" returntype="void" access="public">
        <!---<cfargument name="sessionScope" type="any" required="true" hint="Session Scope"/>
        <cfdump var="#sessionScope#">
        <cfdump var="#arguments.sessionScope.dateInitialized# : #now()#"/> ---->
    </cffunction>
    
    <cffunction  name="onError" access="public" returntype="void" output="true">
        <cfargument name="Exception" type="any" required="true"/>
        <cfargument name="EventName" type="string" required="false" default=""/>
        <cfdump  var="#Exception#">
    </cffunction>

</cfcomponent>