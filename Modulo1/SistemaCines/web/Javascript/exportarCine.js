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

function exportarCine(){
    var idCine = jQuery('#cines option:selected').val();
    
    alert(idCine);
    
    if(idCine != "default")
    {
        jQuery.ajax({ 
            url: 'Controladoras/controladora_exportarCine.jsp', 
            type: 'GET',
            async: true,
            data:{
                idCine : idCine  
            },
            success: function (data)
            {
               alert(data.trim());
            }
        });
    }
    else
    {
        alert('Favor escoger un cine!')
    }
}

jQuery(document).ready(function(){
    getCines(); 
});


