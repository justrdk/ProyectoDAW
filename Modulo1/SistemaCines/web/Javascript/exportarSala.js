function exportarSala(){
   var idSala = jQuery("#salas option:selected").val();
    if(idSala != "default")
    {
        jQuery.ajax({ 
            url: 'Controladoras/controladora_exportarSala.jsp', 
            type: 'GET',
            async: true,
            data:{
                accion:2,
                idSala : idSala  
            },
            success: function (data)
            {
                if(data.trim()=="true"){
                    alert("Configuracion Exportada Exitosamente");
                }
                else{
                    alert('Error al exportar datos, favor intentar de nuevo');
                }
            }
        });
    }
    else
    {
        alert('Favor escoger una Sala!')
    }
}

function getSalas(){
    
    jQuery.ajax({ 
        url: 'Controladoras/controladora_exportarSala.jsp', 
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
            
                jQuery('#salas').empty();
                jQuery('#salas').append('<option value="default">Escoger Sala</option>');
                for(var i =0;i<pz.length-1;i++)
                {
                    wizard = pz[i].split('$');
                    jQuery('#salas').append('<option></option>');
                    jQuery('#salas option:last').attr('value',wizard[0]);
                    jQuery('#salas option:last').append(wizard[1]);
                }
            }
        }
    });
}

jQuery(document).ready(function(){
    getSalas();
});


