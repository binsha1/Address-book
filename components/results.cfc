<cfcomponent>
    <cffunction  name="registerAccount" output="true" access="remote">
        <cfargument  name="full_name" type="string">
        <cfargument  name="email_id" type="string">
        <cfargument  name="user_name" type="string">
        <cfargument  name="pwd" type="string">
        <cfargument  name="c_pwd" type="string">
        <cfif arguments.full_name!="" && arguments.email_id!="" && arguments.user_name!="" && arguments.pwd!="" && arguments.c_pwd!="" && arguments.pwd==arguments.c_pwd>
                <cfquery name="address_book" datasource="address_book">
                    INSERT INTO address_book.user_data(full_name,email_id,user_name,password) 
                    VALUES(<cfqueryparam value="#arguments.full_name#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.user_name#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.pwd#" cfsqltype="CF_SQL_VARCHAR">                   
                     )
                </cfquery>
        </cfif>        
        <cfquery name="address_book" datasource="address_book">
            SELECT * FROM address_book.user_data 
            WHERE email_id=<cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery> 
        <cfreturn address_book.RecordCount>
    </cffunction>
</cfcomponent>