<html>
    <head>
        <link rel="stylesheet" href = "css/style.css">    
        <link href="css/bootstrap.min.css" rel="stylesheet" >        
        <script src="js/bootstrap.bundle.min.js"></script> 
        <link href="css/jquery-ui.css" rel="stylesheet" >
        <link rel="stylesheet" href="fontawesome/css/all.css">
             
        <link rel="stylesheet" href="css/bootstrap_1.min.css"> 
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-contact ">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="dashboard.cfm">ADDRESS BOOK</a>
                </div>
                <ul class="nav navbar-nav">            
                </ul> 
                <cfset currentURL=CGI.SERVER_NAME & CGI.SCRIPT_NAME>            
                <cfif currentURL CONTAINS 'dashboard'>
                    <ul class="nav navbar-nav navbar-right">                
                        <li><a href="./components/results.cfc?method=doLogout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
                    </ul>
                <cfelse>   
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="register.cfm"><i class="fa-solid fa-user"></i> Sign Up</a></li>
                        <li><a href="index.cfm"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login </a></li>
                    </ul>
                </cfif>
            </div>
        </nav>

