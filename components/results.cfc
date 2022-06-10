<cfcomponent accessors="TRUE">
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
                    INSERT INTO address_book.user_data(
                        full_name,
                        email_id,
                        user_name,
                        password) 
                    VALUES(
                        <cfqueryparam value="#arguments.full_name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.user_name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">                   
                        )
                </cfquery>
                <cfif result.RecordCount EQ 1>
                    <cfset local.status=hash('1','sha')>
                </cfif>
            </cfif>          
        </cfif>
        <cflocation  url="../index.cfm?status=#local.status#" addtoken="no">        
    </cffunction>

    <cffunction name="doLogin" access="remote" output="false" >
        <cfargument  name="user_name" type="string" required="true">
        <cfargument  name="pwd" type="string" required="true">
        <cfset local.password=hash(arguments.pwd)>             
        <cfset local.userLoggedIn=false>
        <cfset local.status="">
        <cfquery name="loginData" datasource="address_book">
            SELECT * FROM address_book.user_data WHERE 
            user_name=<cfqueryparam value="#arguments.user_name#" cfsqltype="CF_SQL_VARCHAR">AND 
            password=<cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>                
        <cfif loginData.recordCount EQ 1>
            <cflogin>
                <cfloginuser  name="#loginData.user_name#"  password="#loginData.password#" roles="User">
                </cfloginuser>
            </cflogin>
            <cfset session.sessionUser={'user_id'=loginData.id,'user_name'=loginData.user_name,'full_name'=loginData.full_name}>
          <cfset local.userLoggedIn=true>
        </cfif>
        <cfif local.userLoggedIn EQ true>
            <cflocation  url="../dashboard.cfm" addtoken="no">
        <cfelse>
            <cfset local.status=hash("2",'sha')>
            <cflocation  url="../index.cfm?status=#local.status#" addtoken="no">
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
        <cfargument  name="street_name" type="string">
        <cfargument  name="city" type="string">
        <cfargument  name="state" type="string">
        <cfargument  name="nation" type="string">
        <cfargument  name="pincode" type="integer">
        <cfargument  name="email_id" type="string">
        <cfargument  name="phone" type="string">
        <cfargument  name="user_img" type="string">
        <cfargument  name="user_id" type="integer">        
        <cfset local.status="">
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
            WHERE email_id=<cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfquery name="contact_phone" datasource="address_book" result="contact_phone_res">
            SELECT * FROM address_book.contacts
            WHERE phone_number=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif contact_email_res.RecordCount EQ 0 AND contact_phone_res.RecordCount EQ 0> 
            <cfquery name="contact_user" datasource="address_book" result="contact_res">
                INSERT INTO address_book.contacts(
                    title,
                    first_name,
                    last_name,
                    gender,
                    dob,
                    address,
                    street_name,
                    city,
                    state,
                    nation,
                    pincode,
                    email_id,
                    phone_number,
                    user_photo,u
                    user_id) 
                VALUES(
                        <cfqueryparam value="#arguments.title#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.f_name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.l_name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.gender#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.dob#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.address#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.street_name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.city#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.state#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.nation#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.pincode#" cfsqltype="CF_SQL_INTEGER">,                   
                        <cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_NUMERIC">,
                        <cfqueryparam value="#local.file_name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.user_id#" cfsqltype="CF_SQL_INTEGER">                                   
                        )
            </cfquery>
            <cfif contact_res.RecordCount EQ 1>
                <cfset local.status=hash("1","sha")>
            </cfif>
        </cfif>        
        <cflocation  url="../dashboard.cfm?status=#local.status#" AddToken="no">
    </cffunction>

    <cffunction name="contactData" access="public" output="true">
        <cfquery name="contact_data" datasource="address_book" result="contact_res_data">
            SELECT * FROM address_book.contacts;
        </cfquery>
        <cfreturn contact_data>
    </cffunction>

    <cffunction name="deleteData" access="public" output="true">
        <cfargument  name="id" type="string">        
        <cfset local.status=hash("3","sha")>        
        <cfquery name="contact_data" datasource="address_book" result="contact_del_data">
            DELETE FROM address_book.contacts 
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="./dashboard.cfm?status=#local.status#" addtoken="no">  
    </cffunction>

    <cffunction name="editContact" access="remote" output="false">
        <cfargument  name="title" type="string">
        <cfargument  name="f_name" type="string">
        <cfargument  name="l_name" type="string">
        <cfargument  name="gender" type="string">
        <cfargument  name="dob" type="date">
        <cfargument  name="address" type="string">
        <cfargument  name="street_name" type="string">
        <cfargument  name="city" type="string">
        <cfargument  name="state" type="string">
        <cfargument  name="nation" type="string">
        <cfargument  name="pincode" type="integer">
        <cfargument  name="email_id" type="string">
        <cfargument  name="phone" type="string">
        <cfargument  name="user_img" type="string">        
        <cfargument  name="contact_id" type="integer">
        <cfset local.thisDir = expandPath("../uploads")>
        <cfset local.currDir=expandPath("../files")>
        <cfif len(trim(arguments.user_img)) >      
            <cffile action="upload" fileField="form.user_img"  destination="#thisDir#" result="fileUpload" nameconflict="overwrite">
            <cfset local.file_name=fileupload.serverfile >
        <cfelse>
            <cfset local.file_name="" >           
        </cfif>        
        <cfquery name="edit_contacts" datasource="address_book" result="update_res">
            UPDATE address_book.contacts SET 
            title=<cfqueryparam value="#arguments.title#" cfsqltype="CF_SQL_VARCHAR"> ,
            first_name=<cfqueryparam value="#arguments.f_name#" cfsqltype="CF_SQL_VARCHAR">,
            last_name=<cfqueryparam value="#arguments.l_name#" cfsqltype="CF_SQL_VARCHAR">,
            gender=<cfqueryparam value="#arguments.gender#" cfsqltype="CF_SQL_VARCHAR">, 
            dob=<cfqueryparam value="#arguments.dob#" cfsqltype="CF_SQL_VARCHAR">,
            address=<cfqueryparam value="#arguments.address#" cfsqltype="CF_SQL_VARCHAR">, 
            street_name=<cfqueryparam value="#arguments.street_name#" cfsqltype="CF_SQL_VARCHAR">,
            city=<cfqueryparam value="#arguments.city#" cfsqltype="CF_SQL_VARCHAR">,
            state=<cfqueryparam value="#arguments.state#" cfsqltype="CF_SQL_VARCHAR">,
            nation=<cfqueryparam value="#arguments.nation#" cfsqltype="CF_SQL_VARCHAR">,
            pincode=<cfqueryparam value="#arguments.pincode#" cfsqltype="CF_SQL_INTEGER">,
            email_id=<cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">,
            phone_number=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">,
            user_photo=<cfqueryparam value="#local.file_name#" cfsqltype="CF_SQL_VARCHAR">
            WHERE id=<cfqueryparam value="#arguments.contact_id#" cfsqltype="CF_SQL_INTEGER"> 
        </cfquery>
        <cfif update_res.RecordCount EQ 1>
                <cfset local.status=hash('2','sha')>
        </cfif>           
        <cflocation  url="../dashboard.cfm?status=#local.status#" AddToken="no">
    </cffunction>

    <cffunction name="printFunc" output="true" access="public">
        <cfargument  name="user_id" type="integer">
        <cfquery name="print_res" result="p_res">
            SELECT * FROM address_book.contacts WHERE 
            user_id=<cfqueryparam value="#arguments.user_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn print_res>
    </cffunction>

    <cffunction name="downloadPdf" output="true" access="public">
        <cfargument name="user_id" type="integer">
        <cfquery name="EmpList" datasource="address_book" result="emp_list"> 
            SELECT * FROM address_book.contacts 
            WHERE user_id=<cfqueryparam value="#arguments.user_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn EmpList>
    </cffunction>

    <cffunction name="facebookLogin" access="remote" >        
        <cfoauth type = "Facebook" clientid = "383729900220687" secretkey = "529a4fdeaae1647ac169e88d13856042"
        result = "res"
        redirecturi = "http://localhost:8500/cf_task2/components/results.cfc?method=facebookLogin" >
        
        <cfquery name="loginData" result="queryOut">
            SELECT *FROM address_book.user_data WHERE 
            email_id = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#res.id#">  
        </cfquery>
        <cfif queryOut.RecordCount GT 0>        
            <cfset session.sessionUser={'user_id'=loginData.id,'user_name'=loginData.user_name,'full_name'=loginData.full_name}>
            <cfset Session.logwith = "facebook" />
            <cflocation url="http://localhost:8500/cf_task2/dashboard.cfm" addtoken="no" >
        <cfelse>       
            <cfquery name="address_book" datasource="address_book" result="result">
                    INSERT INTO address_book.user_data(
                        full_name,
                        email_id,
                        user_name,
                        password) 
                    VALUES(
                        <cfqueryparam value="#res.name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#res.id#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#res.name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="" cfsqltype="CF_SQL_VARCHAR">                   
                        )
            </cfquery>
            <cfset session.sessionUser={'user_id'=loginData.id,'user_name'=loginData.user_name,'full_name'=loginData.full_name}>
            <cfset Session.logwith = "facebook" />
            <cflocation url ="http://127.0.0.1:8500/cf_task2/dashboard.cfm" addtoken="no">
        </cfif>
    </cffunction>

    <cffunction name="googleLogin" access="remote" output="true">
        <cfoauth
            type="Google" 
            clientid="789304688534-pg0k44jm7shqa23iag1d45lavb7ulsds.apps.googleusercontent.com" 
            scope="https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile"
            secretkey="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" 
            result="res"  
            redirecturi="http://127.0.0.1:8500/cf_task2/components/results.cfc?method=googleLogin">
            <cfquery  datasource="address_book" result="res_query" name="loginData">
                SELECT * FROM address_book.user_data WHERE email_id=<cfqueryparam CFSQLType="cf_sql_varchar" value="#res.other.email#">
            </cfquery>
            <cfif res_query.RecordCount GT 0>
                <cfset session.sessionUser={'user_id'=loginData.id,'user_name'=loginData.user_name,'full_name'=loginData.full_name}>
                <cfset Session.logwith = "google" /> 
                <cflocation url ="http://127.0.0.1:8500/cf_task2/dashboard.cfm" addtoken="no">
            <cfelse>            
                <cfquery name="address_book" datasource="address_book" result="result">
                    INSERT INTO address_book.user_data(
                        full_name,
                        email_id,
                        user_name,
                        password) 
                    VALUES(
                        <cfqueryparam value="#res.name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#res.other.email#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#res.name#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="" cfsqltype="CF_SQL_VARCHAR">                   
                        )
                </cfquery>
                <cfset session.sessionUser={'user_id'=loginData.id,'user_name'=loginData.user_name,'full_name'=loginData.full_name}>
                <cfset Session.logwith = "google" />
                <cflocation url ="http://127.0.0.1:8500/cf_task2/dashboard.cfm" addtoken="no">
            </cfif>    
    </cffunction>

     <cffunction name="getContactData" access="remote" returnFormat = "json">
        <cfargument name="id" type="integer" required="false" >
        <cfquery name="contacts" result="contact_res" datasource="address_book" returntype="array" >
            SELECT * FROM address_book.contacts
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn contacts> 
    </cffunction>

    <cffunction name="getEmailData" access="remote" returnFormat = "json" >
        <cfargument name="email" type="string" required="false" >
        <cfquery name="contacts"  datasource="address_book" result="email_res">
            SELECT * FROM address_book.contacts
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn email_res> 
    </cffunction>

    <cffunction name="getPhoneData" access="remote" returnFormat = "json" >
        <cfargument name="phone" type="string" required="false" >
        <cfquery name="contacts"  datasource="address_book" result="phone_res">
            SELECT * FROM address_book.contacts
            WHERE phone_number=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn phone_res> 
    </cffunction>

    <cffunction name="getUserEmailData" access="remote" returnFormat = "json" >
        <cfargument name="email" type="string" required="false" >
        <cfquery name="contacts"  datasource="address_book" result="email_res">
            SELECT * FROM address_book.user_data
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn email_res> 
    </cffunction>

    <cffunction name="getUserName" access="remote" returnFormat = "json" >
        <cfargument name="user_name" type="string" required="false" >
        <cfquery name="contacts"  datasource="address_book" result="user_res">
            SELECT * FROM address_book.user_data
            WHERE user_name=<cfqueryparam value="#arguments.user_name#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn user_res> 
    </cffunction>

</cfcomponent>