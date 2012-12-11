function exportarSala(){
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


