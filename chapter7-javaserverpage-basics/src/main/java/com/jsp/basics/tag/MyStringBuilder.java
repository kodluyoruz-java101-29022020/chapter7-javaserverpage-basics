package com.jsp.basics.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class MyStringBuilder extends SimpleTagSupport {

	private String[] parts;

	@Override
	public void doTag() throws JspException, IOException {
		
		getJspContext().getOut().println(buildFullText());
	}
	
	public String[] getParts() {
		return parts;
	}

	public void setParts(String[] parts) {
		this.parts = parts;
	}
	
	private String buildFullText() {
		
		StringBuilder builder = new StringBuilder();
		for(String part : parts) {
			builder.append(part);
			builder.append(" ");
		}
		return builder.toString();
	}
}
