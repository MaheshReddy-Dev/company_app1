// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
<script type="text/javascript" src="ajax.js"></script>
    $(document).ready(function(){
    $('.destroy').on('click', function(){
      if(confirm("Are you sure?")){
      $.ajax({
        url: '/companies/' + this.parentElement.id,
        type: 'DELETE' ,
        success: function(r){
            }
          });
        }
      });
    });
  $(document).ready(function(){
      $('.edit').on('click', function(){
          var id = this.parentElement.id;
          $.ajax({
              url: '/companies/' + id + '/edit',
              type: 'GET' ,
              success: function(r){
                  $('#edit_company_form').html(r);
                }
             });
          });
       });
  $(document).ready(function(){
    $('.new').on('click', function(){
        $.ajax({
            url: '/companies/new',
            type: 'GET' ,
            success: function(r){
                $('#new_company_form').html(r);
             }
           });
        });
     });
  </script>
