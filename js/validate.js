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
/*function validatePasswordField(){
    var passwordInput=document.querySelector('input[name=pwd]');
    var confirmPasswordInput=document.querySelector('input[name=c_pwd]');
    var symbolPattern = /[\!\@\#\$\%\^\&\*]/g;
    var numberPattern = /\d/g;
    var lowercasePattern = /[a-z]/g;
    var uppercasePattern = /[A-Z]/g;
    var pass=passwordInput.value;
    if ((pass.length<8) || (!pass.match(symbolPattern)) || (!pass.match(numberPattern)) ||(!pass.match(lowercasePattern)) ||(!pass.match(uppercasePattern)))
    {
        passwordInput.setCustomValidity('Please match the requested format: Minimum 8 characters, Contain atleast 1 lowercase ,uppercase character, Atleast 1 Number,1 special character');
    }
    
}*/
function validatePasswordField()
{
    var passwordInput=document.querySelector('input[name=pwd]');
    var symbolPattern=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;    
    if(passwordInput.value.match(symbolPattern)) 
    {  
        passwordInput.setCustomValidity('');      
        return true;
    }
    else{
        passwordInput.setCustomValidity('Please match the requested format: Minimum 8 characters, Contain atleast 1 lowercase ,uppercase character, Atleast 1 Number,1 special character');
        return false;
    }

}

function validateCreate(){
    
    var pincode=document.querySelector('input[name=pincode]');
    var phone=document.querySelector('input[name=phone]');
    var pin_pattern=/^[1-9][0-9]{5}$/;
    var ph_pattern=/^\d{10}$/; 
     
    if(!pin_pattern.test(pincode.value))    {
        
        pincode.setCustomValidity("Pincode should be 6 digit number and shouldn't start with 0");
        pincode.value="";
        pincode.focus();        
    }
    else{
        pincode.setCustomValidity('');
    }
    if(!ph_pattern.test(phone.value))
    {
        phone.setCustomValidity('Phone number should be 10 digit number');
        phone.value="";
        phone.focus();
    }
    else{
        phone.setCustomValidity('');
    }   

}
function printTable(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;   
    document.body.innerHTML = printContents;   
    window.print();   
   // document.body.innerHTML = originalContents;
}
/*$('.myModal').on('shown.bs.modal', function(e){
    var s=$('.create').data('id');
    var ed=$(this).data('id');
    var data=$('#edit').data('id');
    
});*/
$('.view_btn').on('click',function(){
    var contact_id=$(this).data('id'); 
    $.ajax({
                url: "./components/results.cfc",
                type: 'get',
                dataType:"json",
                data:{
                method:"getContactData",
                id:contact_id              
                },
                success: function(data)
                {
                    console.log(data);
                    var name=data[0].first_name+ " "+ data[0].last_name;                
                    var address=data[0].address+ ", "+ data[0].street_name+ ", "+ data[0].city+ ", "+ data[0].state+ ", "+ data[0].nation+".";
                    $('#full_name').text(name);
                    $('#gender').text(data[0].gender);
                    $('#d_birth').text(data[0].dob);
                    $('#addr').text(address);
                    $('#pin').text(data[0].pincode);
                    $('#email').text(data[0].email_id);
                    $('#phone').text(data[0].phone_number);
                    var img=data[0].user_photo;
                    if(img!="")                {
                        $("#user_img").html('<img src="./uploads/'+img+'" class="img-fluid img-pic">');
                    }
                    else{
                        $("#user_img").text("");
                    }
                }
            });
});
$('.title').on('click',function(){
    var contact_id=$(this).data('id');    
    if(contact_id>0)
    {
        $("#modal_title").text("EDIT CONTACT");
        $.ajax({   
                    url: "./components/results.cfc",
                    type: 'get',
                    dataType:"json",
                    data:{
                    method:"getContactData",
                    id:contact_id              
                    },
                    success: function(data)
                    {
                        console.log(data);
                        $('#contact_id').val(data[0].id);
                        $('#f_name').val(data[0].first_name);
                        $('#l_name').val(data[0].last_name);
                        $('#dob').val(data[0].dob);
                        $('#address').val(data[0].address);
                        $('#street').val(data[0].street_name);
                        $('#city').val(data[0].city);
                        $('#state').val(data[0].state);
                        $('#nation').val(data[0].nation);
                        $('[name="pincode"]').val(data[0].pincode);
                        $('#email_id').val(data[0].email_id);
                        $('[name="phone"]').val(data[0].phone_number); 
                        $('#formId').attr('action', './components/results.cfc?method=editContact');             
                    }         
                });   
    }
    else
    {        
        $("#modal_title").text("CREATE CONTACT");
        $('#f_name').val("");
        $('#l_name').val("");
        $('#dob').val("");
        $('#address').val("");
        $('#street').val("");
        $('#city').val("");
        $('#state').val("");
        $('#nation').val("");
        $('#email_id').val("");
        $('#pincode').val("");
        $('[name="phone"]').val("");
        $('#formId').attr('action', './components/results.cfc?method=createContact'); 
    }
});
   function validateEmail()
   {
       var email_id=$('#email_id').val();       
       $.ajax({   
        url: "./components/results.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getEmailData",
          email:email_id              
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {
                $('.email_alert').text('Email Already Exists!!');
                $('#sub_btn').prop('disabled', true);
            }
            else{
                $('.email_alert').text(" ");
                $('#sub_btn').prop('disabled', false);
            }                         
        }         
    });       
   }
   function validatePhone()
   {
       var ph_num=$('[name="phone').val();
       var c_id=$('#contact_id').val(); 
       $('.phone_alert').attr('id', 'phone_alert'+c_id);
           
       $.ajax({   
        url: "./components/results.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getPhoneData",
          phone:ph_num              
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {
                
                $('#phone_alert'+c_id).text('Phone Number Already Exists!!');
                $('#sub_btn').prop('disabled', true);
                
            }
            else{

                $('.phone_alert').text("");
                $('#sub_btn').prop('disabled', false);
            }                         
        }         
    });
       
   }
   function checkEmail(){
       var email_add=$('#email_add').val();
       $.ajax({   
        url: "./components/results.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getUserEmailData",
          email:email_add              
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {
                $('.reg_email').css('display','block');
                $('.reg_email').text('Email Already Exists!!')
                $('#reg_btn').prop('disabled', true);
            }
            else{
                $('.reg_email').css('display','none');
                $('.reg_email').text("");
                $('#reg_btn').prop('disabled', false);
            }                         
        }         
    });      
    }
    function checkUserName()
    {
        var u_name=$('#user_name').val();
       $.ajax({   
        url: "./components/results.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getUserName",
          user_name:u_name              
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {
                $('.reg_user').css('display','block');
                $('.reg_user').text('User Name Already Exists!!')
                $('#reg_btn').prop('disabled', true);
            }
            else{
                $('.reg_user').css('display','none');
                $('.reg_user').text("");
                $('#reg_btn').prop('disabled', false);
            }                         
        }         
    });      
    }
 $('.myModal').on('hidden.bs.modal', function (e) {
       location.reload();   
  });
        
