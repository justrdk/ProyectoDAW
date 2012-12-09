function crearCuenta(){
    
    var nombre = jQuery('#nombre').val();
    var edad = jQuery('#edad').val();
    var identidad = jQuery('#identidad').val();
    var password = jQuery('#password').val();
    var cuenta = jQuery('#cuenta').val();
    
    if(nombre.toString().match(/\S/) && edad.toString().match(/\S/) && identidad.toString().match(/\S/) && password.toString().match(/\S/) && cuenta.toString().match(/\S/))
    { 
        jQuery.ajax({ 
            url: 'Controladoras/controladora_crearCuenta.jsp', 
            type: 'GET',
            async: true,
            data: { 
                cuenta:cuenta,
                password:password,
                nombre:nombre,
                edad:edad,
                identidad:identidad
            },  
            success: function (data)
            {
                if(data.trim() == "true")
                {
                    alert("Cuenta creada exitosamente");
                    jQuery('input').val('');
                }
                else
                {
                    alert('Error al ingresar dados en la base de datos.Revisar Campos.')
                }
            }
        });
    }
    else
        {
            alert('Error! No se aceptan campos vacios');
        }
    
}


