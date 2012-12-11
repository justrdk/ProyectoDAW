
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

function getGraphData(){

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
            var id = chuckNorris[0];
            var cantidad = chuckNorris[1];
           
            jQuery.ajax({ 
                url: 'Controladoras/controladora_peliculaMasVista.jsp', 
                type: 'GET',
                async: true,
                data: { 
                    accion:2,
                    idPelicula:id
                },  
                success: function (data2)
                {
                    prepareHighChart(parseInt(cantidad),data2.trim())
                }
            });   
            
        }
    });         
}

jQuery(document).ready(function(){
    getGraphData();
})