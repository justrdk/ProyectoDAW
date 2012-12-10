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
            
                for(var i =0;i<pz.length-1;i++)
                {
                    wizard = pz[i].split('$');
                    jQuery('#cines').append('<option></option>');
                    jQuery('#cines option:last').attr('value',wizard[0]);
                    jQuery('#cines option:last').append(wizard[1]);
                }
            }
        }
    });
    
}

function sendXML(action){
    
    var xmlConfig = jQuery('#xmlConfig').val().trim();

    if(action == 1 && xmlConfig != null)
    {
        var cineObject = jQuery(xmlConfig).find('cine');
        
        if(cineObject.length > 0)
        {
            var nombreCine = jQuery(cineObject).attr('nombre');
            var ciudad = jQuery(cineObject).attr('ciudad');
            var vision = jQuery(cineObject).attr('vision');
            var mision = jQuery(cineObject).attr('mision');
            var logo = jQuery(cineObject).attr('logo');
            var latitud = jQuery(cineObject).attr('latitud');
            var longitud = jQuery(cineObject).attr('longitud');
        
            jQuery.ajax({ 
                url: 'Controladoras/controladora_importarConfig.jsp', 
                type: 'GET',
                async: true,
                data: { 
                    accion:1,
                    nombreCine:nombreCine,
                    ciudad:ciudad,
                    vision:vision,
                    mision:mision,
                    logo:logo,
                    latitud:latitud,
                    longitud:longitud
                },
                success: function (data)
                {
                    if(data.trim()=="true")
                    {
                        alert('Cine importado exitosamente');
                        jQuery('#xmlConfig').val('<root>    \n\n</root>');
                    }
                    else
                    {
                        alert('Error al importar configuracion. Favor Revisar XML');
                        jQuery('#xmlConfig').val('<root>    \n\n</root>');
                    }
                }
            });
        }
        else
        {
            alert('Error en estructura de XML.');
        }
    }
    else if(action == 2 && xmlConfig != null)
    {
        var salaObject = jQuery(xmlConfig).find('sala');
        
        if(salaObject.length > 0 )
        {
            var idCine = jQuery('#cines option:selected').val();
            var nombreSala = jQuery(salaObject).attr('nombre');
            var capacidad = jQuery(salaObject).attr('capacidad');
            
            jQuery.ajax({ 
                url: 'Controladoras/controladora_importarConfig.jsp', 
                type: 'GET',
                async: true,
                data: { 
                    accion:2,
                    idCine:idCine,
                    nombreSala:nombreSala,
                    capacidad:capacidad
                },
                success: function (data)
                {
                    if(data.trim()=="true")
                    {
                        alert('Sala importada exitosamente');
                        jQuery('#xmlConfig').val('<root>    \n\n</root>');
                    }
                    else
                    {
                        alert('Error al importar configuracion. Favor Revisar XML');
                        jQuery('#xmlConfig').val('<root>    \n\n</root>');
                    }
                }
            });
        }
        else
        {
            alert('Error en estructura de XML.');
        }
    }
    else if(action == 3 && xmlConfig != null)
    {
        var peliculaObject = jQuery(xmlConfig).find('pelicula');
        
        if(peliculaObject.length > 0)
        {    
            var nombrePelicula = jQuery(peliculaObject).attr('nombre');
            var duracion = jQuery(peliculaObject).attr('duracion');
            var rating = jQuery(peliculaObject).attr('rating');
            var sinopsis = jQuery(peliculaObject).attr('sinopsis');
            var director = jQuery(peliculaObject).attr('director');
            var trailer = jQuery(peliculaObject).attr('trailer');
            var year = jQuery(peliculaObject).attr('year');
            var genero = jQuery(peliculaObject).attr('genero');
            var idioma = jQuery(peliculaObject).attr('idioma');
            var formato = jQuery(peliculaObject).attr('formato');
            var imagen = jQuery(peliculaObject).attr('imagen');
        
            jQuery.ajax({ 
                url: 'Controladoras/controladora_importarConfig.jsp', 
                type: 'GET',
                async: true,
                data: { 
                    accion:3,
                    nombrePelicula:nombrePelicula,
                    duracion:duracion,
                    rating:rating,
                    sinopsis:sinopsis,
                    director:director,
                    trailer:trailer,
                    year:year,
                    genero:genero,
                    idioma:idioma,
                    formato:formato,
                    imagen:imagen
                },
                success: function (data)
                {
                    alert(data);
                    if(data.trim()=="true")
                    {
                        alert('Pelicula importada exitosamente');
                        jQuery('#xmlConfig').val('<root>    \n\n</root>');
                    }
                    else
                    {
                        alert('Error al importar configuracion. Favor Revisar XML');
                        jQuery('#xmlConfig').val('<root>    \n\n</root>');
                    }
                }
            });
        }
        else
        {
            alert('Error en estructura de XML.');
        }
    }   
  
}

function habilitarSalaXML(){
    
    var opcion = jQuery('#cines option:selected').val();
    
    if(opcion != "default"){
        jQuery('#importarSala').removeAttr('disabled');
    }
    else
    {
        jQuery('#importarSala').attr('disabled','true');  
    }
}

jQuery(document).ready(function(){
    jQuery('#xmlConfig').val('<root>    \n\n</root>');
    getCines();
});