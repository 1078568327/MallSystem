package com.springmvc.filter;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 *
 * 
 */
public final class RequestWrapper extends HttpServletRequestWrapper {
	public RequestWrapper(HttpServletRequest servletRequest) {
		super(servletRequest);
	}

	public String[] getParameterValues(String parameter) {
		String[] values = super.getParameterValues(parameter);
		if (values == null) {
			return null;
		}
		int count = values.length;
		String[] encodedValues = new String[count];
		for (int i = 0; i < count; i++) {
			encodedValues[i] = cleanXSS(parameter, values[i]);
		}
		return encodedValues;
	}

	public String getParameter(String parameter) {
		String value = super.getParameter(parameter);
		if (value == null) {
			return null;
		}
		return cleanXSS(parameter, value);
	}

	public String getHeader(String name) {
		String value = super.getHeader(name);
		if (value == null) {
			return null;
		}
		return cleanXSS(name, value);
	}

	public String getRequestURI() {
		String value = super.getRequestURI();
		if (value == null) {
			return null;
		}
		return cleanXSS("", value);
	}

	public Map getParameterMap() {
		Map result = new HashMap();
		Map reqMap = super.getParameterMap();
		Iterator itr = reqMap.keySet().iterator();

		while (itr.hasNext()) {
			String key = (String) itr.next();
			Object o = reqMap.get(key);
			if (o != null) {
				String[] paramValues = (String[]) o;
				for (int i = 0; i < paramValues.length; i++) {
					paramValues[i] = cleanXSS(key, paramValues[i]);
				}
				result.put(key, paramValues);
			}
		}
		return result;
	}

	private String cleanXSS(String name, String value) {
		value = value.replaceAll("<(?i)script(.*)>", "");
		value = value.replaceAll("<(?i)embed(.*)>", "");
		value = value.replaceAll("<(?i)object(.*)>", "");
		value = value.replaceAll("<(?i)layer(.*)>", "");
		value = value.replaceAll("<(?i)style(.*)>", "");
		value = value.replaceAll("<(?i)meta(.*)>", "");
		value = value.replaceAll("<(?i)iframe(.*)>", "");
		value = value.replaceAll("<(?i)frame(.*)>", "");
		value = value.replaceAll("<(?i)link(.*)>", "");
		value = value.replaceAll("<(?i)import(.*)>", "");
		value = value.replaceAll("<(?i)xml(.*)>", "");

		value = value.replaceAll("[\"\'][\\s]*(?i)javascript:(.*)[\"\']", "");
		value = value.replaceAll("(?i)eval\\((.*)\\)", "");

		// ????sql?????
		String reg = "(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|"
				+ "(\\b(?i)(select|insert|update|delete|count|create|drop|trancate|from|union|"
				+ "where|and|or|into|order|group|by|asc|desc|exec|declare|master|execute)\\b)";
		value = value.replaceAll(reg, "");

		char content[] = new char[value.length()];
		value.getChars(0, value.length(), content, 0);
		StringBuffer result = new StringBuffer(content.length + 50);
		for (int i = 0; i < content.length; i++) {
			switch (content[i]) {
			case '<':
				result.append("&lt;");
				break;
			case '>':
				result.append("&gt;");
				break;
			/*
			case '&':
				result.append("&amp;");
				break;*/
			case '"':
				result.append("&quot;");
				break;
			// case '|':
			// result.append("&#124;");
			// break;
			// case ';':
			// result.append("&#59;");
			// break;
			// case '$':
			// result.append("&#36;");
			// break;
			// case '%':
			// result.append("&#37;");
			// break;
			// case '@':
			// result.append("&#64;");
			// break;
			case '\'':
				result.append("&#39;");
				break;
			// case '(':
			// result.append("&#40;");
			// break;
			// case ')':
			// result.append("&#41;");
			// break;
			// case '+':
			// result.append("&#43;");
			// break;
			// case '\r':
			// result.append("&#13;");
			// break;
			// case '\n':
			// result.append("&#10;");
			// break;
			// case ',':
			// result.append("&#44;");
			// break;
			// case '\\':
			// result.append("&#92;");
			// break;
			default:
				result.append(content[i]);
			}
		}

		value = result.toString();
		return value;
	}
}