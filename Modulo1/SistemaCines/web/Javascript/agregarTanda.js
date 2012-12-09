
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

function getSalas(){

    var idCine = jQuery('#cines option:selected').val();
    
    if(idCine != "default")
    {
        jQuery.ajax({ 
            url: 'Controladoras/getSalas.jsp', 
            type: 'GET',
            async: true,
            data: { 
                idCine:idCine
            },  
            success: function (data)
            {
                if(data.trim() != "none")
                { 
                    var pz = data.trim().split('#');
                    var wizard = new Array();
                    jQuery('#salas').empty();
                    jQuery('#salas').append('<option value=default>Escoger Sala</option>');
                    for(var i =0;i<pz.length-1;i++)
                    {
                        wizard = pz[i].split('$');
                        jQuery('#salas').append('<option></option>');
                        jQuery('#salas option:last').attr('value',wizard[0]);
                        jQuery('#salas option:last').append(wizard[1]);
                    }
                }
                else
                {
                    alert("No hay salas para el cine seleccionado!Favor crearlas");
                }
            }
        });            
    }
    else
    {
        alert("Favor escoger un cine.");
        jQuery('#salas').empty();
    }
}

function fillTable(data){
    
    var deagle = data.split('#');
    jQuery('.peli').empty();
    for(var i = 0; i<deagle.length-1;i++)
    {
        var bazooka = deagle[i].split('$');
        jQuery('#peliculas').append('<tr class="peli"></tr>');
        jQuery('#peliculas tr:last').append('<td></td>');
        jQuery('#peliculas tr:last td:last').append(bazooka[0]);
       
        jQuery('#peliculas tr:last').append('<td></td>');
        jQuery('#peliculas tr:last td:last').append(bazooka[1]);
       
        jQuery('#peliculas tr:last').append('<td></td>');
        jQuery('#peliculas tr:last td:last').append(bazooka[2]);
       
        jQuery('#peliculas tr:last').append('<td></td>');
        jQuery('#peliculas tr:last td:last').append(bazooka[3]);
       
        jQuery('#peliculas tr:last').append('<td></td>');
        jQuery('#peliculas tr:last td:last').append(bazooka[4]);
    }
    seleccionarFila();
}

function getPeliculas(){
    jQuery.ajax({ 
        url: 'Controladoras/getPeliculas.jsp', 
        type: 'GET',
        async: true, 
        success: function (data)
        {
            if(data.trim() != "none")
            { 
                fillTable(data.trim());
            }
            else
            {
                alert("No hay Peliculas creadas en el sistema.");
            }
        }
    });
}

function guardarTanda()
{
    var fecha = jQuery('#fecha').val().trim();
    var horaInicial = fecha + " " + jQuery('#horaInicial').val().trim();
    var horaFinal = fecha + " " + jQuery('#horaFinal').val().trim();
    var idPelicula = jQuery('.selectedRow').text().trim();
    var idSala = jQuery('#salas option:selected').val();
     
    if(fecha.toString().match(/\S/) && horaInicial.toString().match(/\S/) && horaFinal.toString().match(/\S/) && idPelicula.toString().match(/\S/) && idSala.toString().match(/\S/))
    {
        jQuery.ajax({ 
            url: 'Controladoras/controladora_agregarTanda.jsp', 
            type: 'GET',
            async: true,
            data: { 
                accion : 1,
                fecha : fecha,
                horaInicial : horaInicial,
                horaFinal : horaFinal,
                idSala : idSala,
                idPelicula : idPelicula
            },  
            success: function (data)
            {
                if(data.trim() == "true")
                {
                    alert('Tanda Ingresada exitosamente!');   
                }
            }
        });
    }
    else{
        alert('Todos los campos son requeridos favor llenarlos');
    }
}

function seleccionarFila(){
    jQuery('#peliculas td').click(function(){
        var valoresFila = jQuery(this).parent('tr').find('td');
        var id = jQuery(valoresFila[0]);
        jQuery('#peliculas td').css('color','#555').removeAttr('class','selectedRow');
        jQuery(valoresFila).css('color','red');
        jQuery(id).attr('class','selectedRow');
    });
}

jQuery(document).ready(function(){   
    getCines();
    jQuery('#pelicula').chromatable();
    jQuery("#fecha").datepicker({
        dateFormat: 'yy-mm-dd'
    });
});
