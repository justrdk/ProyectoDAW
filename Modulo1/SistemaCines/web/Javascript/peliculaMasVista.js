
function prepareHighChart(cantidad,nombrePelicula){
    var options = {
        chart: {
            renderTo: 'reporte',
            defaultSeriesType: 'column'
        },
        title: {
            text: 'Pelicula Más VIsta'
        },
        xAxis: {
            categories: ["Asistencias"]
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Cantidad Asistencias'
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
                this.x +': '+ this.y +' asistencias';
            }
        },
        series: [{
            name: nombrePelicula,
            data: [cantidad]
        }]
    };
    
    var chart = new Highcharts.Chart(options);
}

function prepareHighChartWithArray(data){
    var options = {
        chart: {
            renderTo: 'reporte',
            defaultSeriesType: 'column'
        },
        title: {
            text: 'Cantidad Asistencias/Película'
        },
        xAxis: {
            categories: ["Asistencias"]
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Cantidad Asistencias'
            }
        },
        legend: {
            layout: 'vertical',
            backgroundColor: '#FFFFFF',
            align: 'center',
            verticalAlign: 'center',
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
                this.x +': '+ this.y +' asistencias';
            }
        },
        series: []
    };
    
    for(var i = 0;i<data.length;i++){
        var nombre = data[i].split('-')[0];
        var asistencias = data[i].split('-')[1];
        
        options.series.push({
            name : nombre,
            data : [parseInt(asistencias)]
        })
        
    }
    
    var chart = new Highcharts.Chart(options);
}

function getGraphData(tipo){

    if(tipo == 1)
    {   
        jQuery.ajax({ 
            url: 'Controladoras/controladora_peliculaMasVista.jsp', 
            type: 'GET',
            async: true,
            data: { 
                accion:1
            },  
            success: function (data)
            {
                var chuckNorris = data.trim().split(',');
                var nombrePeli = chuckNorris[0];
                var cantidad = chuckNorris[1];
         
                prepareHighChart(parseInt(cantidad),nombrePeli);            
            }
        }); 
    }
    else{
        jQuery.ajax({ 
            url: 'Controladoras/controladora_peliculaMasVista.jsp', 
            type: 'GET',
            async: true,
            data: { 
                accion:2
            },  
            success: function (data)
            {
                var chuckNorris = data.trim().split('$');
                var dataChart = new Array();
                
                for(var i=0;i<chuckNorris.length-1;i++)
                {
                    var pz = chuckNorris[i].split(',');
                    dataChart.push(pz[0]+'-'+pz[1]);
                }
                prepareHighChartWithArray(dataChart);            
            }
        }); 
    }
}

function showGraph(){
    
    var tipoReporte = jQuery('#opciones option:selected').val();
    
    if(parseInt(tipoReporte) != 0)
    {
        getGraphData(parseInt(tipoReporte));     
    }
    else{
        jQuery('#reporte').empty();
    }
}



jQuery(document).ready(function(){
    //getGraphData(1);
})