function mensaje(){
    var men = getParameterByName("insercion") != "" ? getParameterByName("insercion") : null ;
    
    if(men == "true")
    {
        alert("Cine creado exitosamente!");
    }
    else if(men == "false")
    {
          alert("Error al crear cine, favor verificar los campos");  
    }
}

jQuery(document).ready(function(){
    mensaje();
})