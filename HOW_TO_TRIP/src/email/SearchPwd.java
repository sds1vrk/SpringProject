package email;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

public class SearchPwd {
	public void sendEmail(String email,String pwd) {
		String host="smtp.naver.com";
		String subject="여행어때 비밀번호 찾기 결과";
		String fromName="여행어때 관리자";
		String from="how_to_trip@naver.com";
		String to1=email;
		String content ="안녕하세요 회원님의 비밀번호는"+pwd+"입니다.";
		
		try {
			Properties props=new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol","smtp");
			props.put("mail.smtp.host",host);
			props.put("mail.smtp.port","587");
			props.put("mail.smtp.user",from);
			props.put("mail.smtp.auth","true");
			Session	mailsession=Session.getInstance(props,
					new javax.mail.Authenticator(){
						protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("how_to_trip@naver.com","sist1234");
						}
		});
		Message msg=new MimeMessage(mailsession);
		msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));
		InternetAddress[] address1= {new InternetAddress(to1)};
		msg.setRecipients(Message.RecipientType.TO, address1);
		msg.setSubject(subject);
		msg.setSentDate(new java.util.Date());
		msg.setContent(content,"text/html;charset=euc-kr");
		Transport.send(msg);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}
