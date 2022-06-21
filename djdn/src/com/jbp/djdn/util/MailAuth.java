package com.jbp.djdn.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {

	PasswordAuthentication pa;
	    
    public MailAuth() {
        String mail_id = "djdn2442@gmail.com";
        String mail_pw = "ekwoeksmd1!";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }


}
