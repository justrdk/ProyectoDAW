function getCines(){
    
    jQuery.ajax({ 
        url: 'Controladoras/getCines.jsp', 
        type: 'GET',
        async: true,
        success: function (data)
        {
            if(data.trim() != "none")
            { 
                var pz = data.trim().split('#');
                var wizard = new Array();
            
                jQuery('#cines').empty();
                jQuery('#cines').append('<option value="default">Escoger Cine</option>');
                for(var i =0;i<pz.length-1;i++)
                {
                    wizard = pz[i].split('$');
                    jQuery('#cines').append('<option value='+wizard[0]+'></option>');
                    jQuery('#cines option:last').append(wizard[1]);
                }
            }
        }
    });
}

function getDatosCine(idCine){
        
    jQuery.ajax({ 
        url: 'Controladoras/controladora_editarCine.jsp', 
        type: 'GET',
        async: true,
        data : {
            accion:1,
            idCine : idCine
        },
        success: function (data)
        {
            if(data.trim() != "none")
            { 
                var pz = data.trim().split('#');
                var wizard = new Array();
                var inputs = jQuery('.inputs');

                wizard = pz[0].split('$');
                for(var j = 0; j<wizard.length;j++)
                {
                    jQuery(inputs[j]).val(wizard[j]);
                }
                
            }
        }
    });
}

function llenarCampos(){

    var chuckNorris = jQuery('#cines option:selected').val();
    
    if(chuckNorris != "default")
    {
        jQuery('.inputs').removeAttr('disabled');
        jQuery('#guardarTanda').removeAttr('disabled');
        var idCine = jQuery('#cines option:selected').val();
        getDatosCine(idCine);
    }
    else
    {   
        jQuery('.inputs').attr('disabled','true');
        jQuery('#guardarTanda').attr('disabled','true');
        jQuery('.inputs').val('');
    }
}

function editarCine(){
    
    var lata = jQuery('#cines option:selected').val();
    var nombre = jQuery('#nombreCine').val();
    var ciudad = jQuery('#ciudadCine').val();
    var logo = jQuery('#logoCine').val();
    var vision = jQuery('#visionCine').val();
    var mision = jQuery('#misionCine').val();
    var latitud = jQuery('#latitudCine').val();
    var longitud = jQuery('#longitudCine').val();
    jQuery.ajax({ 
        url: 'Controladoras/controladora_editarCine.jsp', 
        type: 'GET',
        async: true,
        data : {
            accion:2,
            idCine : lata,
            nombre:nombre,
            ciudad:ciudad,
            logo:logo,
            vision:vision,
            mision:mision,
            latitud:latitud,
            longitud:longitud
        },
        success: function (data)
        {
            if(data.trim() == "true"){
                alert("Cine modificado Exitosamente!");
                getCines();
                jQuery('.inputs').val('');
                jQuery('.inputs').attr('disabled','true');
                jQuery('#guardarTanda').attr('disabled','true');
            }
            else
            {
                alert("Error al actualizar datos, favor intentar de nuevo");
            }
        }
    });
}

jQuery(document).ready(function(){
    getCines();
});

