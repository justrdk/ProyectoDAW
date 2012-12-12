function getPeliculas(){
    
    jQuery.ajax({ 
        url: 'Controladoras/controladora_exportarPelicula.jsp', 
        type: 'GET',
        async: true,
        data : {
            accion:1
        },
        success: function (data)
        {
            if(data.trim() != "none")
            { 
                var pz = data.trim().split('#');
                var wizard = new Array();
            
                for(var i =0;i<pz.length-1;i++)
                {
                    wizard = pz[i].split('$');
                    jQuery('#peliculas').append('<option></option>');
                    jQuery('#peliculas option:last').attr('value',wizard[0]);
                    jQuery('#peliculas option:last').append(wizard[1]);
                }
            }
        }
    });
}

function exportarPelicula(){
    var idPelicula = jQuery('#peliculas option:selected').val();
    
    if(idPelicula != "default"){        
        jQuery.ajax({ 
            url: 'Controladoras/controladora_exportarPelicula.jsp', 
            type: 'GET',
            async: true,
            data : {
                accion:2,
                idPelicula:idPelicula
            },
            success: function (data)
            {
                if(data.trim() == "true"){
                    alert("Configuracion exportada exitosamente");
                }
                else
                {
                    alert("Error al exportar data!");
                }
            }
        });
    }
}

jQuery(document).ready(function(){
    getPeliculas();
});

