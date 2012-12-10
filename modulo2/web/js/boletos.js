jQuery(document).ready(function(){
	
	   
    
    jQuery("#sillas td").click(function()
    {    
                
        var clase = jQuery(this).attr('class');
        var contador = jQuery("#sillas .selected").length;
    
        if(clase == "selected")
        {               
            jQuery(this).attr("class","free");
            jQuery(this).find("img").attr("src","css/images/vacio.gif");
        }else if (clase == "free" && contador < contarCantidades())
        {   
            jQuery(this).attr("class","selected");
            jQuery(this).find("img").attr("src","css/images/sele.gif");
        }
        
    
    
    });
    
    jQuery("#cantidades input").change(function()
    {
        costo = parseFloat(jQuery(this).parent().next().text().split("L.")[1]);
        cant = parseInt(jQuery(this).val());
        jQuery(this).parent().next().next().text("L. " + costo * cant);
        
        jQuery("#tot").html(contarSubtotales());
    
    });
     
        
});


function contarCantidades()
{
    var cantidades = jQuery("#cantidades input")
    var total = 0;
    for(var i = 0; i < cantidades.length; i++)
    {
        total += parseInt(jQuery(cantidades[i]).val());
    }
    
    return total;
}

function contarSubtotales()
{
    var cantidades = jQuery("#cantidades .sub")
    var total = 0;
    for(var i = 0; i < cantidades.length; i++)
    {
        total += parseInt(jQuery(cantidades[i]).text().split("L.")[1]);
    }
    
    return total;
}


function getSillas()
{
    var a = new Array();
    
    jQuery.each(jQuery(".selected"), function()
    {
        var col = jQuery(this).parent().children().index(jQuery(this));
        var row = jQuery(this).parent().parent().children().index(jQuery(this).parent());  
      
        a.push( row + ',' + col );      

    });
    
    return a;
}

function getCantidades()
{
    var cantidades = jQuery("#cantidades input")
    var a = new Array();
    for(var i = 0; i < cantidades.length; i++)
    {
        a.push(parseInt(jQuery(cantidades[i]).val()));
    }
    
    return a;
}


function comprar()
{
    var cuenta = jQuery("#cuenta").val();
    
    jQuery.ajax(
    {
        url: 'controladora_boletos.jsp',
        type: "post",
        dataType: "json",
        data:{
            conf:getSillas().join(";"), cant:getCantidades().join(","), idTanda:QS('idTanda'), tar:cuenta
            },
        success: function(data) 
        {
                    
        }	  
    });
    
    window.location = "http://localhost:8084/modulo2/";
    
    
}

function QS(name)
{
  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
  var regexS = "[\\?&]" + name + "=([^&#]*)";
  var regex = new RegExp(regexS);
  var results = regex.exec(window.location.search);
  if(results == null)
    return "";
  else
    return decodeURIComponent(results[1].replace(/\+/g, " "));
}


