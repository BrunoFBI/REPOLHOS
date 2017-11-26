package MyProjectDominio;

public class Cupom extends EntidadeDominio {
 String serial;
 double desconto;
 public double getDesconto() {
	return desconto;
}
public void setDesconto(double desconto) {
	this.desconto = desconto;
}
public String getSerial() {
		return serial;
	}
	public void setSerial(String serial) {
		this.serial = serial;
	}
	

}
