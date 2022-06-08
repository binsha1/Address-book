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
$('.myModal').on('shown.bs.modal', function(e){
    var s=$('.create').data('id');
    var ed=$(this).data('id');
    var data=$('#edit').data('id');
    
});
$('.view').on('click',function(){
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
                var name=data.DATA[0][2]+ " "+ data.DATA[0][3];
                var address=data.DATA[0][6]+ " "+ data.DATA[0][7]+ " "+ data.DATA[0][8]+ " "+ data.DATA[0][9]+ " "+ data.DATA[0][10];
                $('#full_name').text(name);
                $('#gender').text(data.DATA[0][4]);
                $('#d_birth').text(data.DATA[0][5]);
                $('#addr').text(address);
                $('#pin').text(data.DATA[0][12]);
                $('#email').text(data.DATA[0][11]);
                $('#phone').text(data.DATA[0][13]);
                var img=data.DATA[0][14];
                if(img!="")
                {
                    $("#user_img").append('<img src="./uploads/'+img+'" class="img-fluid img-pic">');
                }
            }
    })
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
                $('#contact_id').val(data.DATA[0][0]);
                $('#f_name').val(data.DATA[0][2]);
                $('#l_name').val(data.DATA[0][3]);
                $('#dob').val(data.DATA[0][5]);
                $('#address').val(data.DATA[0][6]);
                $('#street').val(data.DATA[0][7]);
                $('#city').val(data.DATA[0][8]);
                $('#state').val(data.DATA[0][9]);
                $('#nation').val(data.DATA[0][10]);
                $('[name="pincode"]').attr('value',data.DATA[0][12]);
                $('#email_id').val(data.DATA[0][11]);
                $('[name="phone"]').val(data.DATA[0][13]); 
                $('#formId').attr('action', './components/results.cfc?method=editContact');              
              
            }         
        });   
    }
    else{
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
        $('#phone').val("");
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
       var ph_num=$('#phone').val();
       alert(ph_num);
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
                $('.phone_alert').text('Phone Number Already Exists!!');
                $('#sub_btn').prop('disabled', true);
            }
            else{
                $('.phone_alert').text(" ");
                $('#sub_btn').prop('disabled', false);
            }                         
        }         
    });
       
   }
        
