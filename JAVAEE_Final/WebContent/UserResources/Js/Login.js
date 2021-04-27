function ajax_login(email,password,redirectPage){
    var urlEnd="http://127.0.0.1:3000/login";
    $.ajax({
        type:'post',
        url: urlEnd,
        dataType: 'json',
        contentType:'application/json',
        success: function(data,status){
            alert(data.user+" Login Successful")
            // console.log(JSON.stringify(data));
            var user=String(data.user);
            if(user=="admin"){
                window.location.href="http://127.0.0.1:3000/admin";
            }
            else
            {
                if(redirectPage.includes("Register")||redirectPage.include("login")){
                    window.location.href='/';
                }
                else{
                window.location.href=redirectPage;}
            }
        },
        error: function(status,jqXhr,textStatus){
            if(textStatus=="Not Found"){
            alert("Message: "+"Please Register First and try Again Later")
            $("#sts").html('Error: '+"User is not Registered").css({"color":"Red","font-weight":"bold"});}
            else if(textStatus=="Unauthorized"){
            alert("Message: "+"Wrong Password")
            $("#sts").html('Error:'+"Password Does not Match with Record").css({"color":"Red","font-weight":"bold"});}
        },
        data: '{"email":"'+email+'","password":"'+password+'"}'
    });
}