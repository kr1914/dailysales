package com.daily.svc;

import java.util.Date;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

		//Key값들 :: email:보낸 메일주소, result:성공or실패, time:발송시간
		HashMap<String,String> result = null;
		//SMTP 정보
		final String user = "kre1914@naver.com";
		final String password = "rmdwjd?1!=";
		
	public boolean excute(String email, String title, String text){
		
		boolean result = false;
		//naver SMTP 정보
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com"); 
		prop.put("mail.smtp.port", 465); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "true"); 
		prop.put("mail.smtp.ssl.trust", "smtp.naver.com");

		//naver Session 생성
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
		 try {
	            MimeMessage message = new MimeMessage(session);
	            
	            //발신자
	            message.setFrom(new InternetAddress(user));

	            //수신자
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

	            //제목
	            message.setSubject(title);

	            //내용
	            message.setText(text);

	            // send the message
	            Transport.send(message); ////전송
	            System.out.println("message sent successfully...");
	            result = true;
			 
			 
	        } catch (AddressException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
		 

		 
		 
		return result;
	}

}
