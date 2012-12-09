function mensaje(){
    var men = getParameterByName("insercion") != "" ? getParameterByName("insercion") : null ;
    
    if(men == "true")
    {
        alert("Precio creado exitosamente!");
    }
    else if(men == "false")
    {
          alert("Error al crear Precio, favor verificar los campos ingresados");  
    }
}

jQuery(document).ready(function(){
    mensaje();
})