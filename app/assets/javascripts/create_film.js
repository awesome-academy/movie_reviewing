$(function(){
  remove_fields = function(event, link){
    $(link).prev('input[type=hidden]').val('1');
    $(link).closest('fieldset').hide();
    event.preventDefault();
  };

  add_fields = function(event, link){
    var time = new Date().getTime();
    var regexp = new RegExp($(link).data('id'), 'g');
    $(link).before($(link).data('fields').replace(regexp, time));
    event.preventDefault();
  }
});
