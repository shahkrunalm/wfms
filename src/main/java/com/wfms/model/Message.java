package com.wfms.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MESSAGE")
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="MESSAGE_ID")
	private long messageId;

	@Column(name="MSG_FROM")
	private String msgFrom;
	
	@Column(name="MSG_TO")
	private String msgTo;
	
	@Column(name="SUBJECT")
	private String subject;
	
	@Column(name="CONTENT")
	private String content;
	
	@Column(name="SENT_DATE_TIME")
	private Date dateTime;
	
	@Column(name="FROM_DELETE_STATUS")
	private int fromDeleteStatus;
	
	@Column(name="TO_DELETE_STATUS")
	private int toDeleteStatus;
	
	@Column(name="READ_STATUS")
	private int readStatus;
	
	@Column(name="TRASH_STATUS")
	private int trashStatus;

	public long getMessageId() {
		return messageId;
	}

	public void setMessageId(long messageId) {
		this.messageId = messageId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public int getFromDeleteStatus() {
		return fromDeleteStatus;
	}

	public void setFromDeleteStatus(int fromDeleteStatus) {
		this.fromDeleteStatus = fromDeleteStatus;
	}

	public int getToDeleteStatus() {
		return toDeleteStatus;
	}

	public void setToDeleteStatus(int toDeleteStatus) {
		this.toDeleteStatus = toDeleteStatus;
	}

	public int getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(int readStatus) {
		this.readStatus = readStatus;
	}

	public int getTrashStatus() {
		return trashStatus;
	}

	public void setTrashStatus(int trashStatus) {
		this.trashStatus = trashStatus;
	}

	public String getMsgFrom() {
		return msgFrom;
	}

	public void setMsgFrom(String msgFrom) {
		this.msgFrom = msgFrom;
	}

	public String getMsgTo() {
		return msgTo;
	}

	public void setMsgTo(String msgTo) {
		this.msgTo = msgTo;
	}

	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", msgFrom=" + msgFrom
				+ ", msgTo=" + msgTo + ", subject=" + subject + ", content="
				+ content + ", dateTime=" + dateTime + ", fromDeleteStatus="
				+ fromDeleteStatus + ", toDeleteStatus=" + toDeleteStatus
				+ ", readStatus=" + readStatus + ", trashStatus=" + trashStatus
				+ "]";
	}
	
	
}
