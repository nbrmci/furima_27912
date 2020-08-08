$(function(){
  $('#item_price').on('input', function(){
    let data = $('#item_price').val();
    let profit = Math.round(data * 0.1)
    let fee = (data - profit)
    $('#add-tax-price').html(profit)
    $('#profit').html(fee)
    $('#item_price').val(data)
    if(profit == ''){
      $('price-content').html('');
      $('price-content').html('');
    }
  })
})