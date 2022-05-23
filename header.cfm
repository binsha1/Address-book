    <nav class="navbar navbar-contact ">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">ADDRESS BOOK</a>
            </div>
            <ul class="nav navbar-nav">            
            </ul> 
            <cfset currentURL=CGI.SERVER_NAME & CGI.SCRIPT_NAME>            
            <cfif currentURL CONTAINS 'dashboard'>
                <ul class="nav navbar-nav navbar-right">                
                    <li><a href="index.cfm?logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                </ul>
            <cfelse>   
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="register.cfm"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                    <li><a href="index.cfm"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </cfif>
        </div>
    </nav>