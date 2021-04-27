$(document).ready(function() {
    
    $("button").click(function(){
        var page=document.location.pathname.match(/[^\/]+$/)[0];
        var requestPage=document.referrer;
        var email_id=$("#user_id").val();
        var pass=$("#password").val();
        var pass2=$("#r_password").val();
        var fname=$("#fname").val();
        var lname=$("#lname").val();
        var age=$("#age").val();
        var contact_no=$("#contact_no").val();
        if(page=="Register")
        {   
            validate_Register(fname,lname,age,email_id,pass,pass2,contact_no)
        }
        else if(page=="login"){
            validate_login(email_id,pass,requestPage)
        }
    });
});
function validate_Register(first_name,last_name,age,email,password,r_password,contact)
{
    if(first_name==('') || last_name==('') || age==('') || contact==('') || email==('') || password==('')){
        alert("Please Enter all Required Fields")
    }
    else{
        if(IsEmail(email)==false)
        {
            alert("Please Enter a Valid Email Address");
        }
        else
        {
            alert(r_password)
            if(CheckPassword(password)==false)
            {
                alert("Password lenght should be atleast 6 character and contain at least one UpperCase and lowerCase and a numberic digit")
            }
            else if(!(password==r_password)){
                alert("Confirm password does not Match with Password. Try Again")
            }
            else if(contact_valid(contact)==false){
                alert("Please Check your contact no and try Again.")
            }
        }
    }
}
function validate_login(email,password,page)
{
    if(email==('') || password==('')){
        alert("Please Enter all Required Fields")
    }
    else{
        if(IsEmail(email)==false)
        {
            alert("Please Enter a Valid Email Address");
        }
        else
        {
            if(CheckPassword(password)==false)
            {
                alert("Password lenght should be atleast 6 character and contain at least one UpperCase and lowerCase and a numberic digit")
            }
            else{
                ajax_login(email,password,page)
            }
        }
    }
}
function IsEmail(email_id)
{
var eml = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!eml.test(email_id)) 
    {
        return false;
    }
    else
    {
        return true;
    }
}
function CheckPassword(Password) 
{ 
    var pass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
    if(!pass.test(Password)) 
    { 
        return false;
    }
    else
    { 
        return true;
    }
}
function contact_valid(number) 
{ 
    var pattern = /^\(?([1-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
    if(!pattern.test(number)) 
    { 
        return false;
    }
    else
    { 
        return true;
    }
}