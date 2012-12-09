/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author Gabriel
 */
public class Cine {
    
    private int idCine;
    private String nombre;
    private String ciudad;
    private String vision;
    private String mision;
    private String logo;
    private String latitud;
    private String longitud;

    public Cine(int idCine, String nombre, String ciudad) {
        this.idCine = idCine;
        this.nombre = nombre;
        this.ciudad = ciudad;
    }

    public Cine(int idCine, String nombre, String ciudad, String vision, String mision, String logo, String latitud, String longitud) {
        this.idCine = idCine;
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.vision = vision;
        this.mision = mision;
        this.logo = logo;
        this.latitud = latitud;
        this.longitud = longitud;
    }

    public int getIdCine() {
        return idCine;
    }

    public void setIdCine(int idCine) {
        this.idCine = idCine;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }

    public String getMision() {
        return mision;
    }

    public void setMision(String mision) {
        this.mision = mision;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }
    
    
    
}
