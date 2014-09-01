// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//

// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.ui.all
//= require local_time
//= require bootstrap-datetimepicker
//= require pickers
//= require locales/bootstrap-datetimepicker.hu
//= require_tree .

//= require bootstrap-datepicker
//= require bootstrap-timepicker
//= require bootstrap-datetimepicker


$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "dd-mm-yyyy", "weekStart": 1, "autoclose": true})
});

function validate()
	{
  	document.getElementById("status_project_name").innerHTML="*";
		var project_name=document.getElementById("status_project_name").value;
		if(project_name =="")
			{
		  	alert("You must Enter Project Name");
		    document.getElementById("status_project_name").focus();
		    return false
		  }
	 var client_name=document.getElementById("status_client_name").value;
	 if(client_name =="")
		 {
			 alert("You must Enter Client Name");
		   document.getElementById("status_client_name").focus();
		   return false
		  }
   if(!isNaN(client_name))
 	   {
   	   alert("Numeric value not Allow");
       document.getElementById("status_client_name").focus();
       return false;
      }
   if(client_name.length < 5)
 	   {
   	   alert("Client Name too short");
       document.getElementById("status_client_name").focus();
       return false;
      }    
	 var co_ordinato=document.getElementById("status_co_ordinator").value;
	 if(co_ordinato =="")
		 {
		   alert("You must Enter Co-ordinator Name");
		   document.getElementById("status_co_ordinator").focus();
		   return false
		  }
	 var date=document.getElementById("status_date").value;
	 if(date =="")
	   {
		   alert("Select Date");
		   document.getElementById("status_date").focus();
		   return false
		  }	

   var da=document.getElementById("#").value;
	 if(da!="" || da=="")
	   {
	   	 var a=confirm("Do you Want to Continue.......!!!!");
          if(a==1)
          {
            alert("You Press ok");
          }
          else
          {
            document.getElementById("status_resion").focus();
		        return false
           }		   
		  }	
  }




        





	        



