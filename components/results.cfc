<cfcomponent>
    <cffunction  name="registerAccount" output="true" access="remote">
        <cfargument  name="full_name" type="string">
        <cfargument  name="email_id" type="string">
        <cfargument  name="user_name" type="string">
        <cfargument  name="pwd" type="string">
        <cfargument  name="c_pwd" type="string">
        <cfset local.status="">
         <cfset local.password = hash(arguments.pwd)>            
        <cfquery name="address_email" datasource="address_book" result="email_res">
            SELECT * FROM address_book.user_data 
            WHERE email_id=<cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfquery name="address_user" datasource="address_book" result="user_res">
            SELECT * FROM address_book.user_data 
            WHERE user_name=<cfqueryparam value="#arguments.user_name#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif email_res.RecordCount NEQ 0>
            <cfset local.status="2">
        </cfif>
        <cfif user_res.RecordCount NEQ 0>
            <cfset local.status="3">            
        </cfif>
        <cfif arguments.full_name!="" && arguments.email_id!="" && arguments.user_name!="" && arguments.pwd!="" && arguments.c_pwd!="" && arguments.pwd==arguments.c_pwd>
            <cfif email_res.RecordCount EQ 0 AND user_res.RecordCount EQ 0>
                <cfquery name="address_book" datasource="address_book" result="result">
                    INSERT INTO address_book.user_data(full_name,email_id,user_name,password) 
                    VALUES(<cfqueryparam value="#arguments.full_name#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.user_name#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">                   
                        )
                </cfquery>
                <cfif result.RecordCount EQ 1>
                    <cfset local.status="1">
                </cfif>
            </cfif>          
        </cfif>
        <cflocation  url="../register.cfm?status=#local.status#">        
    </cffunction>

    <cffunction name="doLogin" access="remote" output="false" returntype="boolean">
        <cfargument  name="user_name" type="string" required="true">
        <cfargument  name="pwd" type="string" required="true">
        <cfset local.password=hash(arguments.pwd)>             
        <cfset local.userLoggedIn=false>
        <cfquery name="loginData" datasource="address_book">
            SELECT * FROM address_book.user_data WHERE user_name=<cfqueryparam value="#arguments.user_name#" cfsqltype="CF_SQL_VARCHAR"> AND password=<cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>                
        <cfif loginData.recordCount EQ 1>
            <cflogin>
                <cfloginuser  name="#loginData.user_name#"  password="#loginData.password#" roles="User" >
                </cfloginuser>
            </cflogin>
            <cfset session.sessionUser={'user_id'=loginData.id,'user_name'=loginData.user_name,'full_name'=loginData.full_name}>
            <cfset local.userLoggedIn=true>
        </cfif>
        <cfif local.userLoggedIn EQ true>
            <cflocation  url="../dashboard.cfm">
        <cfelse>
            <cflocation  url="../index.cfm?invalid=1">
        </cfif>
    </cffunction>

    <cffunction name="doLogout" access="public" output="false">
        <cfset structDelete(session, "sessionUser")>
        <cflogout>
    </cffunction>
</cfcomponent>
