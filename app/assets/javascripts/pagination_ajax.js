$(function(){
   $('.pagination a').on('click', function(){
      $.ajax({
         method: 'GET',
         url: this.href,
         type: 'JSON'
      }).success(function(data){
         // console.log(data);
         // console.log(data.html);
         var a= $('data .review-section-body').text();
         console.log(a);
      })
      return false;
   });
});