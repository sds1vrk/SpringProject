package email;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

import java.util.Properties;

public class EmailCheck {
	public void sendEmail(String email,String authNum) {
		String host="smtp.naver.com";
		String subject="���� ������ȣ";
		String fromName="���� ������";
		String from="how_to_trip@naver.com";
		String to1=email;
		String content ="�ȳ��ϼ��� ���� ȸ������ ������ȣ��["+authNum+"]�Դϴ�."
				+ "<br>������ ���Ű� ȯ���մϴ�.";
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
	public String RandomNum() {
		StringBuffer buffer=new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n=(int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
}
