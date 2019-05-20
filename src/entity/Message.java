package entity;

import java.io.Serializable;
import java.util.Date;

/*
 *  1、类名:消息类
 *  2、属性:发送者、接收者、消息内容、发送时间
 *  3、方法: 设置消息的收发双方、内容、时间
           获取消息的收发双方、内容、时间
 */


public class Message implements Serializable {
	
	private String from;
	private String to;
	private String content;
	private Date time;

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Message [from=" + from + ", to=" + to + ", content=" + content + ", time=" + time + "]";
	}

}
