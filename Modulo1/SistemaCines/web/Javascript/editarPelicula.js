function getPeliculas(){
    
    var bazinga = "";
    var omfg = new Array();
    
    jQuery.ajax({ 
        url: 'Controladoras/getPeliculas.jsp', 
        type: 'GET',
        async: true, 
        success: function (data)
        {
            if(data.trim() != "none")
            { 
                bazinga = data.split('#');
                jQuery('#peliculas').empty();
                jQuery('#peliculas').append('<option value=default>Escoger Película</option>');
                for(var i = 0; i<bazinga.length-1;i++)
                {
                    omfg = bazinga[i].split('$');
                    
                    jQuery('#peliculas').append('<option value='+omfg[0]+'></option>');
                    jQuery('#peliculas option:last').append(omfg[1]);
                }
            }
            else
            {
                
            }
        }
    });
}

function getDatosPelicula(idPelicula){
        
    jQuery.ajax({ 
        url: 'Controladoras/controladora_editarPelicula.jsp', 
        type: 'GET',
        async: true,
        data : {
            accion:1,
            idPelicula : idPelicula
        },
        success: function (data)
        {
            if(data.trim() != "none")
            { 
                console.log(data.trim());
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

    var chuckNorris = jQuery('#peliculas option:selected').val();
    
    if(chuckNorris != "default")
    {
        jQuery('.inputs').removeAttr('disabled');
        jQuery('#guardarPelicula').removeAttr('disabled');
        var idPelicula = chuckNorris;
        getDatosPelicula(idPelicula);
    }
    else
    {   
        jQuery('.inputs').val('').attr('disabled','true');
        jQuery('#guardarPelicula').attr('disabled','true');
    }
}

function editarPelicula(){
    
    var idPeli = jQuery('#peliculas option:selected').val();
    var nuevoNombre = jQuery('#nombrePelicula').val();
    var nuevaDuracion = jQuery('#duracionPelicula').val();
    var nuevoRating = jQuery('#ratings option:selected').val();
    var nuevoDirector = jQuery('#directorPelicula').val();
    var nuevoTrailer = jQuery('#trailerPelicula').val();
    var nuevoYear = jQuery('#yearPelicula').val();
    var nuevoGenero = jQuery('#generoPelicula').val();
    
    var nuevoIdioma = jQuery('#idiomaPelicula').val();
    var nuevoFormato = jQuery('#formatoPelicula').val();
    var nuevaImagen = jQuery('#imagenPelicula').val();
    var nuevaSinopsis = jQuery('#sinopsisPelicula').val();
    
    
    jQuery.ajax({ 
        url: 'Controladoras/controladora_editarPelicula.jsp', 
        type: 'GET',
        async: true,
        data : {
            accion:2,
            idPelicula:idPeli,
            nuevoNombre:nuevoNombre,
            nuevaDuracion:nuevaDuracion,
            nuevoRating:nuevoRating,
            nuevoDirector:nuevoDirector,
            nuevaSinopsis:nuevaSinopsis,
            nuevoTrailer:nuevoTrailer,
            nuevoYear:nuevoYear,
            nuevoGenero:nuevoGenero,
            nuevoIdioma:nuevoIdioma,
            nuevoFormato:nuevoFormato,
            nuevaImagen:nuevaImagen
        },
        success: function (data)
        {
            if(data.trim() == "true")
            {
                alert("Sala modificada Exitosamente!");
                getPeliculas();
                jQuery('.inputs').val('').attr('disabled','true');
                jQuery('#guardarPelicula').attr('disabled','true');
            }
            else
            {
                alert("Error al actualizar datos, favor intentar de nuevo");
            }
        }
    });
}

jQuery(document).ready(function(){
    getPeliculas(); 
});