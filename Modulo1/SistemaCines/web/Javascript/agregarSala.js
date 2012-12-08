/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function getCines(){
    
    jQuery.ajax({ 
        url: 'Controladoras/controladora_agregarSala.jsp', 
        type: 'GET',
        async: true,
        data: { 
            accion : 1
        },  
        success: function (data)
        {
            if(data.trim() != "none")
            { 
                var pz = data.trim().split('#');
                var wizard = new Array();
                var lata = false;
            
                for(var i =0;i<pz.length-1;i++)
                {
                    wizard = pz[i].split(',');
                    jQuery('#cines').append('<option value='+wizard[0]+'></option>');
                    jQuery('#cines option:last').append(wizard[1]);
                }
            }
        }
    });
    
}

function guardarSala()
{
    var idCine = jQuery('#cines option:selected').val();
    var nombreSala = jQuery('#nombreSala').val();
    
    if(nombreSala.toString().match(/\S/))
    {
        jQuery('#errorMessage').css('display','none');
        jQuery.ajax({ 
            url: 'Controladoras/controladora_agregarSala.jsp', 
            type: 'GET',
            async: true,
            data: { 
                accion : 2,
                idCine:idCine,
                nombreSala:nombreSala
            },  
            success: function (data)
            {
                if(data.trim() == "true")
                {
                     alert('Sala creada exitosamente!');   
                     jQuery('#nombreSala').val('');
                }
            }
        });
    }
    else{
        jQuery('#errorMessage').css('display','block');
    }
}

jQuery(document).ready(function(){
    getCines();
});