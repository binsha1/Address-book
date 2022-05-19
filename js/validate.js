function validatePassword()
{
    var password = document.querySelector('input[name=pwd]');
    var confirm = document.querySelector('input[name=c_pwd]');
    if (confirm.value === password.value) {
        confirm.setCustomValidity('');
    } else {
        confirm.setCustomValidity('Passwords do not match');
    } 
}
function validatePasswordField(){
    var passwordInput=document.querySelector('input[name=pwd]');
    var confirmPasswordInput=document.querySelector('input[name=c_pwd]');
    var symbolPattern = /[\!\@\#\$\%\^\&\*]/g;
    var numberPattern = /\d/g;
    var lowercasePattern = /[a-z]/g;
    var uppercasePattern = /[A-Z]/g;
    var pass=passwordInput.value;
    if ((pass.length<8) || (!pass.match(symbolPattern)) || (!pass.match(numberPattern)) ||(!pass.match(lowercasePattern)) ||(!pass.match(uppercasePattern)))
    {
        passwordInput.setCustomValidity('Please match the requested format: Minimum 8 characters, Contain atleast 1 lowercase ,uppercase character, Atleast 1 Number');
    }
    /*
    else if(!pass.match(symbolPattern))
    {
        pass="";
        confirmPasswordInput.value=" ";
        passwordInput.setCustomValidity('Password must contain atleast one symbol');        
    }
    else if(!pass.match(numberPattern))
    {
        passwordInput.setCustomValidity('Password must contain atleast one number');
    }
    else if(!pass.match(lowercasePattern))
    {
        passwordInput.setCustomValidity('Password must contain atleast one lower case character');
    }
    else if(!pass.match(uppercasePattern))
    {
        passwordInput.setCustomValidity('Password must contain atleast one upper case character');
    }*/
}