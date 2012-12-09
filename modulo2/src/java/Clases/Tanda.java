/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author Gabriel
 */
public class Tanda {
    
    private int idTanda;
    private int idSala;
    private int idPelicula;
    private String fecha;
    private String horaI;
    private String horaF;    
    private String nombre;
    private String duracion;
    private String rating;
    private String sinopsis;
    private String director;
    private String trailer;
    private int year;
    private String genero;
    private String idioma;
    private String formato;
    private String imagen;

    public Tanda(int idTanda, int idSala, int idPelicula, String fecha, String horaI, String horaF, String nombre, String duracion, String rating, String sinopsis, String director, String trailer, int year, String genero, String idioma, String formato, String imagen) {
        this.idTanda = idTanda;
        this.idSala = idSala;
        this.idPelicula = idPelicula;
        this.fecha = fecha;
        this.horaI = horaI;
        this.horaF = horaF;
        this.nombre = nombre;
        this.duracion = duracion;
        this.rating = rating;
        this.sinopsis = sinopsis;
        this.director = director;
        this.trailer = trailer;
        this.year = year;
        this.genero = genero;
        this.idioma = idioma;
        this.formato = formato;
        this.imagen = imagen;
    }

    public int getIdTanda() {
        return idTanda;
    }

    public void setIdTanda(int idTanda) {
        this.idTanda = idTanda;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public int getIdPelicula() {
        return idPelicula;
    }

    public void setIdPelicula(int idPelicula) {
        this.idPelicula = idPelicula;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHoraI() {
        return horaI;
    }

    public void setHoraI(String horaI) {
        this.horaI = horaI;
    }

    public String getHoraF() {
        return horaF;
    }

    public void setHoraF(String horaF) {
        this.horaF = horaF;
    }

    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getSinopsis() {
        return sinopsis;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
    
}
