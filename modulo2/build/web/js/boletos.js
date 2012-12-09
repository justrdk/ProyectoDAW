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
