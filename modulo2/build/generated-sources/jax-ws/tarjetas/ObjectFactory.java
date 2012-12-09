
package tarjetas;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the tarjetas package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _HelloResponse_QNAME = new QName("http://tarjetas/", "helloResponse");
    private final static QName _VerificarSaldo_QNAME = new QName("http://tarjetas/", "verificarSaldo");
    private final static QName _VerificarSaldoResponse_QNAME = new QName("http://tarjetas/", "verificarSaldoResponse");
    private final static QName _Hello_QNAME = new QName("http://tarjetas/", "hello");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: tarjetas
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link Hello }
     * 
     */
    public Hello createHello() {
        return new Hello();
    }

    /**
     * Create an instance of {@link VerificarSaldoResponse }
     * 
     */
    public VerificarSaldoResponse createVerificarSaldoResponse() {
        return new VerificarSaldoResponse();
    }

    /**
     * Create an instance of {@link VerificarSaldo }
     * 
     */
    public VerificarSaldo createVerificarSaldo() {
        return new VerificarSaldo();
    }

    /**
     * Create an instance of {@link HelloResponse }
     * 
     */
    public HelloResponse createHelloResponse() {
        return new HelloResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link HelloResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://tarjetas/", name = "helloResponse")
    public JAXBElement<HelloResponse> createHelloResponse(HelloResponse value) {
        return new JAXBElement<HelloResponse>(_HelloResponse_QNAME, HelloResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link VerificarSaldo }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://tarjetas/", name = "verificarSaldo")
    public JAXBElement<VerificarSaldo> createVerificarSaldo(VerificarSaldo value) {
        return new JAXBElement<VerificarSaldo>(_VerificarSaldo_QNAME, VerificarSaldo.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link VerificarSaldoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://tarjetas/", name = "verificarSaldoResponse")
    public JAXBElement<VerificarSaldoResponse> createVerificarSaldoResponse(VerificarSaldoResponse value) {
        return new JAXBElement<VerificarSaldoResponse>(_VerificarSaldoResponse_QNAME, VerificarSaldoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Hello }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://tarjetas/", name = "hello")
    public JAXBElement<Hello> createHello(Hello value) {
        return new JAXBElement<Hello>(_Hello_QNAME, Hello.class, null, value);
    }

}
