<html>
    <head>
        <link rel="stylesheet" href = "css/style.css">    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet"type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"> </script>    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">      
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
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

