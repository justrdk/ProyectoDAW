jQuery(document).ready(function(){
	
	   
    jQuery("#search-field").datepicker({dateFormat: "yy-mm-dd"});
    
    jQuery.ajax(
	{
	  url: 'controladora_cines.jsp',
	  type: "GET",
	  dataType: "json",
	  /*data:{action:0},*/
	  success: function(data) 
	  {
                for(var i = 0; i < data.length; i++)
                {
                    jQuery("#cines").append("<option value='"+ data[i].idCine +"'>"+ data[i].nombre + " - " + data[i].ciudad +"</option>")
                }	
	  }
	});	
        
     jQuery.ajax(
	{
	  url: 'controladora_cartelera.jsp',
	  type: "GET",
	  dataType: "json",
	  data:{idCine:1, fecha:hoy()},
	  success: function(data)
          {
              crearCartelera(data);
          }
	});
        
});

function hoy()
{
    Date.prototype.yyyymmdd = function() {
   var yyyy = this.getFullYear().toString();
   var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
   var dd  = this.getDate().toString();
   return yyyy + '-' +(mm[1]?mm:"0"+mm[0]) + '-' + (dd[1]?dd:"0"+dd[0]); // padding
        };

      var d = new Date();
      return d.yyyymmdd();
}

function buscar()
{
    var idCine = jQuery('#cines :selected').val();
    var fecha = jQuery("#search-field").val()
    
    jQuery.ajax(
	{
	  url: 'controladora_cartelera.jsp',
	  type: "GET",
	  dataType: "json",
	  data:{idCine:idCine, fecha:fecha},
	  success: function(data)
          {              
              crearCartelera(data);
          }
	});
}

function crearCartelera(data)
{
    //vaciar cartelera
    jQuery("#content").empty();
    
    //agregar los ids a un arreglo
    var ids = new Array();
    for (var i = 0; i < data.length; i++)
    {        
        ids.push(data[i].idPelicula);
    }  
    
    //eliminar duplicados
    ids = ids.filter(function(elem, pos) 
    {    
        return ids.indexOf(elem) == pos;
    });
    
    //recorrer peliculas
    for(var i =  0; i < ids.length; i++)
    {
        var filtroPeliculas = jQuery.grep(data, function(element, index)
        {
              return element.idPelicula == ids[i];
        });
        
        var horarios = "";
        for(var j = 0; j < filtroPeliculas.length; j++)
        {
            horarios += '<li><a href="boletos.jsp?idTanda='+filtroPeliculas[j].idTanda+'">'+filtroPeliculas[j].horaI.split(" ")[1] + ' - ' + filtroPeliculas[j].horaF.split(" ")[1] +'</a></li>';
        }
        
        jQuery("#content").append('<div class="box"><div class="head"><h2>'+
            filtroPeliculas[0].nombre +'</h2> <p class="text-right"><a href="#">'+ filtroPeliculas[0].nombre +'</a></p>'
            + '</div> <div class="movie"> <div class="movie-image">'
            + '<a href="#"><span class="play"><span class="name">'+ filtroPeliculas[0].nombre +
            '</span></span><img src="'+ filtroPeliculas[0].imagen +'" alt="movie" /></a> </div>' +
            '<div class="info">' +filtroPeliculas[0].sinopsis+ '<ul id="'+ filtroPeliculas[0].idPelicula +'" class="horas">'+ horarios +'</ul></div></div></div>');
    }
    
    
                                         
}
