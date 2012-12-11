
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

function prepareHighChart(cantidad,nombreSala){
    var options = {
        chart: {
            renderTo: 'reporte',
            defaultSeriesType: 'column'
        },
        title: {
            text: 'Total Tickets Vendidos'
        },
        xAxis: {
            categories: ["Tickets"]
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Cantidad Tickets'
            }
        },
        legend: {
            layout: 'vertical',
            backgroundColor: '#FFFFFF',
            align: 'left',
            verticalAlign: 'top',
            x: 100,
            y: 70,
            floating: true,
            shadow: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        tooltip: {
            formatter: function() {
                return ''+
                this.x +': '+ this.y +' unidades vendidas';
            }
        },
        series: [{
            name: nombreSala,
            data: [cantidad]
        }]
    };
    
    var chart = new Highcharts.Chart(options);
}

function getGraphData(){
    
    var idSala = jQuery('#salas option:selected').val();
    
    if(idSala != "default")
    {
        jQuery.ajax({ 
            url: 'Controladoras/controladora_ventasPorSala.jsp', 
            type: 'GET',
            async: true,
            data: { 
                accion:1,
                idSala:idSala
            },  
            success: function (data)
            {
                var cantidad = parseInt(data.trim());
                var nombreSala = jQuery('#salas option:selected').text();
                prepareHighChart(cantidad,nombreSala);
            }
        });         
    }
    else
    {
        alert("Favor escoger un cine")
    }
      
}

jQuery(document).ready(function(){
    getCines();
})