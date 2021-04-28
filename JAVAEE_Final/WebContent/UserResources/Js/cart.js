$(document).ready(function(){
  console.log("hello");
  var total=0;
  $('.temp-price').each(function() {
	  total+=parseFloat($(this).val());
  })
  $('.order_Total').val(total);
  console.log(total);
  $('.minus-btn').on('click', function(e) {
      e.preventDefault();
      var $this = $(this);
      var $input = $this.closest('div').find('.order_qnty');
      var value = parseInt($input.val());
      var $price = $this.parents('.item').find('.qnty-price');
      var price_available = parseFloat($price.val().replace('$',''));
      var $price1 = $this.parents('.item').find('.temp-price');
      var temp_price = parseFloat($price1.val().replace('$',''));
      var $order_total = $('.order_Total');
      var order_total=parseFloat($order_total.val().replace('$',''));
      if (value > 1) {
          value = value - 1;
          price_available-=temp_price;
          order_total-=temp_price;
          console.log(price_available);
            console.log(temp_price)
      }
      price_available=String("$"+price_available.toFixed(2));
      order_total=String("$"+order_total.toFixed(2));
      $input.val(value);
      $price.val(price_available);
      $order_total.val(order_total);
  });

  $('.plus-btn').on('click', function(e) {
      e.preventDefault();
      var $this = $(this);
      var $input = $this.closest('div').find('.order_qnty');
      var value = parseInt($input.val());
      var $input2 = $this.closest('div').find('.qnty');
      var qnty_available = parseInt($input2.val());
      var $price = $this.parents('.item').find('.qnty-price');
      var price_available = parseFloat($price.val().replace('$',''));
      var $price1 = $this.parents('.item').find('.temp-price');
      var temp_price = parseFloat($price1.val().replace('$',''));
      var $order_total = $('.order_Total');
      var order_total=parseFloat($order_total.val().replace('$',''));
      if (qnty_available>value) {
            value = value + 1;
        console.log(price_available);
        console.log(temp_price)
        price_available+=temp_price;
        order_total+=temp_price;
      } 
      else {
        alert("Item quntity limit exceed!!!");
      }
      price_available=String("$"+price_available.toFixed(2));
      order_total=String("$"+order_total.toFixed(2));
      $input.val(value);
      $price.val(price_available);
      $order_total.val(order_total);
  });

  $('.like-btn').on('click', function() {
  $(this).toggleClass('is-active');
  });
  
})