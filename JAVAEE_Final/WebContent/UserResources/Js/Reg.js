function ajax_reg(fname,lname,age,email_id,pass,contact){
    var urlEnd="http://127.0.0.1:3000/Register";
    $.ajax({
        type:'post',
        url: urlEnd,
        dataType: 'json',
        contentType:'application/json',
        success: function(data,status){
            console.log(data.user)
            alert(email_id +" You have Registered Successfully")
            console.log(JSON.stringify(data));
            // $("#sts").html(status+': '+data.user)
        },
        error: function(status,jqXhr,textStatus){
            if(textStatus=="Not Found"){
                // alert("Message: "+"Please Register First and try Again Later")
            // $("#sts").html('Error: '+"User Not Found");
            }
            else if(textStatus=="Unauthorized"){
                alert(email_id+" You have already Registered! Please Try to Login.")
                // $("#sts").html('Error:'+"Password Does not Match with Record");
            }
        },
        data: '{"fname":"'+fname+'","lname":"'+lname+'","age":"'+age+'","contact_no":"'+contact+'","user_id":"'+email_id+'","password":"'+pass+'"}'
    });
}