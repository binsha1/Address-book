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

    <cffunction name="createContact" access="remote" output="false">
        <cfargument  name="title" type="string">
        <cfargument  name="f_name" type="string">
        <cfargument  name="l_name" type="string">
        <cfargument  name="gender" type="string">
        <cfargument  name="dob" type="date">
        <cfargument  name="address" type="string">
        <cfargument  name="street" type="string">
        <cfargument  name="city" type="string">
        <cfargument  name="state" type="string">
        <cfargument  name="nation" type="string">
        <cfargument  name="pincode" type="integer">
        <cfargument  name="email" type="string">
        <cfargument  name="phone" type="string">
        <cfargument  name="user_img" type="string">
        <cfargument  name="user_id" type="integer">
        <cfquery name="loginData" datasource="address_book">
            SELECT * FROM address_book.user_data WHERE id=<cfqueryparam value="#arguments.user_id#" >
        </cfquery> 
        <cfset session.sessionUser={'user_id'=loginData.id,'user_name'=loginData.user_name,'full_name'=loginData.full_name}>
        <cfset local.create="">
        <cfset local.thisDir = expandPath("../uploads")>
        <cfset local.currDir=expandPath("../files")>
        <cfif len(trim(arguments.user_img)) >      
            <cffile action="upload" fileField="form.user_img"  destination="#thisDir#" result="fileUpload" nameconflict="overwrite">
            <cfset local.file_name=fileupload.serverfile >
        <cfelse>
            <cfset local.file_name="" >           
        </cfif>
        <cfquery name="contact_email" datasource="address_book" result="contact_email_res">
            SELECT * FROM address_book.contacts
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfquery name="contact_phone" datasource="address_book" result="contact_phone_res">
            SELECT * FROM address_book.contacts
            WHERE phone_number=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif contact_email_res.RecordCount EQ 0 AND contact_phone_res.RecordCount EQ 0> 
            <cfquery name="contact_user" datasource="address_book" result="contact_res">
                INSERT INTO address_book.contacts(title,first_name,last_name,gender,dob,address,street_name,city,state,nation,pincode,email_id,phone_number,user_photo,user_id) 
                VALUES(<cfqueryparam value="#arguments.title#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.f_name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.l_name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.gender#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.dob#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.address#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.street#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.city#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.state#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.nation#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.pincode#" cfsqltype="CF_SQL_INTEGER">,                   
                        <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_NUMERIC">,
                        <cfqueryparam value="#local.file_name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.user_id#" cfsqltype="CF_SQL_INTEGER">                                   
                        )
            </cfquery>
            <cfif contact_res.RecordCount EQ 1>
                <cfset local.create="1">
            </cfif>
        </cfif>        
        <cfif contact_email_res.RecordCount NEQ 0>
            <cfset local.create="2">
        <cfelseif contact_phone_res.RecordCount NEQ 0>
            <cfset local.create="3">
        </cfif>
        <cflocation  url="../dashboard.cfm?create=#local.create#">
    </cffunction>

    <cffunction name="contactData" access="public" output="true">
        <cfquery name="contact_data" datasource="address_book" result="contact_res_data">
            SELECT * FROM address_book.contacts;
        </cfquery>
        <cfreturn contact_data>
    </cffunction>
</cfcomponent>
