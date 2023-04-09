package icia.team.bonheur.utils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import icia.team.bonheur.beans.EmailBean;

@Component
public class EmailService {
	@Autowired
	private	JavaMailSenderImpl mail; // 이메일 인증
	
	public boolean sendEmail(EmailBean eb) {
		boolean result = false;
		
		MimeMessage javaMail = this.mail.createMimeMessage();
		MimeMessageHelper mailHelper = new MimeMessageHelper( javaMail, "UTF-8");
		
		try {
			for(int mailIdx = 0; mailIdx < eb.getReceiver().size(); mailIdx++ ) {

				mailHelper.setFrom(eb.getSender());
				mailHelper.setTo(eb.getReceiver().get(mailIdx)[1]);
				mailHelper.setSubject(eb.getSubject());
				mailHelper.setText(eb.getContents(), eb.isHtml()); /* true : HTML사용 */

				this.mail.send(javaMail);
				result = true;
			}
		} catch (MessagingException e) {e.printStackTrace();}
		return result;
	}
}
