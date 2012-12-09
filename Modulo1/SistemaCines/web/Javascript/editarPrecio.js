function getPrecios()
{
    jQuery.ajax({ 
        url: 'Controladoras/controladora_editarPrecio.jsp', 
        type: 'GET',
        async: true,
        data: { 
            accion:1
        },
        success: function (data)
        {
            if(data.trim() != "none")
            { 
                var pz = data.trim().split('#');
                var wizard = new Array();
                jQuery('#precios').empty();
                jQuery('#precios').append('<option value="default">Escoger un Precio</option>');
                for(var i =0;i<pz.length-1;i++)
                {
                    wizard = pz[i].split('$');
                    jQuery('#precios').append('<option></option>');
                    jQuery('#precios option:last').attr('value',wizard[0]+'-'+wizard[1]);
                    jQuery('#precios option:last').append(wizard[0]+ " "+wizard[1]);
                }
            }
        }
    });
}


function llenarCamposPrecio()
{     
    var temp = jQuery('#precios option:selected').val();
    
    if(temp != "default"){
        
        var datos = temp.split('-');
        var id = datos[0];
        var precio = datos[1];
        jQuery('#nombrePrecio').removeAttr('disabled').val(id);
        jQuery('#precioNuevo').removeAttr('disabled').val(precio);
        jQuery('#guardarPrecio').removeAttr('disabled');        
    }
    else
    {
        jQuery('#nombrePrecio').val('').attr('disabled','true');
        jQuery('#precioNuevo').val('').attr('disabled','true');
        jQuery('#guardarPrecio').attr('disabled','true');
    }
}

function editarPrecio(){
    
    var idNuevo = jQuery('#nombrePrecio').val();
    var idPrecio = jQuery('#precios option:selected').val().split('-')[0];
    var precio = jQuery('#precioNuevo').val();
    
    if(idNuevo.toString().match(/\S/) && precio.toString().match(/\S/))
    {
        jQuery.ajax({ 
            url: 'Controladoras/controladora_editarPrecio.jsp', 
            type: 'GET',
            async: true,
            data: { 
                accion:2,
                idPrecio:idPrecio,
                idNuevo:idNuevo,
                precioNuevo:precio
            },
            success: function (data)
            {
                if(data.trim() == "true")
                {
                    alert("Precio Editado Exitosamente");
                    jQuery('input').val('').attr('disabled','true');
                    jQuery('#guardarPrecio').attr('disabled','true');
                    getPrecios();
                }
                else
                {
                    alert("Error al ingresar cambios en Base de Datos");
                }
            }
        });   
    }
    else
    {
        alert('No pueden haber campos vacios');
    }
}

jQuery(document).ready(function(){
    getPrecios(); 
});