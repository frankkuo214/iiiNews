package CR.javamail;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailSend {
	private JavaMailSender mailSender;
	 
	public JavaMailSender getMailSender() {
		return mailSender;
	}
 
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
 
	public void sendMail(String from, String to, String subject, String msg) {
		MimeMessage message = mailSender.createMimeMessage();
 
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
 
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(msg);
 
		}
		catch (MessagingException e) {
			throw new MailParseException(e);
		}
 
		mailSender.send(message);
	}
 
}

