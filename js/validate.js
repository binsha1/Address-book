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
    
}
function validateCreate(){
    var pincode=document.querySelector('input[name=pincode]');
    var phone=document.querySelector('input[name=phone]');
    var pin_pattern=/^\d{6}$/;
    var ph_pattern=/^\d{10}$/;
    alert('dfgd');
    if(!pin_pattern.test(pincode.value))
    {
        pincode.setCustomValidity('Pincode should be 6 digit number');
        pincode.value="";
        pincode.focus();
        return false;
    }
    else if(!ph_pattern.test(phone.value))
    {
        phone.setCustomValidity('Phone number should be 10 digit number');
        phone.value="";
        phone.focus();
        return false;
    }
    return true;

}
