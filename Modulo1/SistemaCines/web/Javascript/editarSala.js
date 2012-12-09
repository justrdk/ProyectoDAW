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
function getSalas(){
   
    jQuery.ajax({ 
        url: 'Controladoras/controladora_editarSala.jsp', 
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
            
                jQuery('#salas').empty();
                jQuery('#salas').append('<option value="default">Escoger Sala</option>');
                for(var i =0;i<pz.length-1;i++)
                {
                    wizard = pz[i].split('$');
                    jQuery('#salas').append('<option value='+wizard[0]+'></option>');
                    jQuery('#salas option:last').append(wizard[1]);
                }
            }
        }
    });           
}

function getDatosSala(idSala){
     
    jQuery.ajax({ 
        url: 'Controladoras/controladora_editarSala.jsp', 
        type: 'GET',
        async: true,
        data: { 
            accion:2,
            idSala:idSala
        },  
        success: function (data)
        {
            if(data.trim() != "none")
            { 
                var nombreSala = data.trim().split('$')[0];
                var cineActual = data.trim().split('$')[1];
                jQuery('#nombreSala').val(nombreSala);
                jQuery('#cineActual').val(cineActual);
            }
        }
    });           
}

function llenarCamposSala(){
    
    var idSala = jQuery('#salas option:selected').val();
    
    if(idSala != "default"){
        jQuery('#nombreSala').removeAttr('disabled');
        jQuery('#guardarSala').removeAttr('disabled');
        getDatosSala(idSala);
    }
    else
    {
        jQuery('#nombreSala').attr('disabled','true');
        jQuery('#guardarSala').attr('disabled','true');
        jQuery('.inputs').val('');
    }

}

function editarSala(){
    var idSala = jQuery('#salas option:selected').val();
    var nuevoNombre = jQuery('#nombreSala').val();
    var idNuevoCine = jQuery('#cines option:selected').val();
    
    var action = idNuevoCine != "default" ? 3 : 4;
    
    jQuery.ajax({ 
        url: 'Controladoras/controladora_editarSala.jsp', 
        type: 'GET',
        async: true,
        data : {
            accion:action,
            idSala:idSala,
            nuevoNombre:nuevoNombre,
            idNuevoCine:idNuevoCine
            
        },
        success: function (data)
        {
            if(data.trim() == "true")
            {
                alert("Sala modificada Exitosamente!");
                getSalas();
                getCines();
                jQuery('#nombreSala').val('');
                jQuery('#cineActual').val('');
                jQuery('#nombreSala').attr('disabled','true');
                jQuery('#guardarSala').attr('disabled','true');
            }
            else
            {
                alert("Error al actualizar datos, favor intentar de nuevo");
            }
        }
    });
    
}

jQuery(document).ready(function(){
    getSalas(); 
    getCines();
});