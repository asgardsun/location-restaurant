package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class NaverMail extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("202044003@itc.ac.kr", "rlatmd456@");
	}
}
