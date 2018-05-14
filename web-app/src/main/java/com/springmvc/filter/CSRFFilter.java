package com.springmvc.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CSRFFilter implements Filter {
	private static Log logger = LogFactory.getLog(CSRFFilter.class);
	private boolean isValid = true;
	private List<String> ipList = new ArrayList<String>();
	private List<String> excludeList = new ArrayList<String>();
	private String errorPage = "";

	public void init(FilterConfig filterConfig) throws ServletException {
		Locale.setDefault(Locale.ENGLISH);
		String isValidTmp = filterConfig.getInitParameter("isValid");
		if ("false".equalsIgnoreCase(isValidTmp)) {
			isValid = false;
		}
		
		String whiteIpList = filterConfig.getInitParameter("whiteIpList");
		if (null != whiteIpList && !"".equals(whiteIpList.trim())) {
			String[] ips = whiteIpList.split(",");
			for (int i = 0; i < ips.length; i++) {
				ipList.add(ips[i].trim().replaceAll(" ", "").toLowerCase());
			}
		}
		
		String exclude = filterConfig.getInitParameter("excludeList");
		if (null != exclude && !"".equals(exclude.trim())) {
			String[] excludes = exclude.split(",");
			for (int i = 0; i < excludes.length; i++) {
				excludeList.add(excludes[i].trim().replaceAll(" ", "")
						.toLowerCase());
			}
		}
		
		errorPage = filterConfig.getInitParameter("errorPage");
	}

	private boolean isValidDomain(String url) {
		Locale.setDefault(Locale.ENGLISH);
		for (int i = 0; i < ipList.size(); i++) {
			String str = (String) ipList.get(i);
			if (url.toLowerCase().startsWith(str))
				return true;
		}
		return false;
	}

	private boolean isExclude(HttpServletRequest request) {
		Locale.setDefault(Locale.ENGLISH);
		String url = request.getRequestURI();
		for (int i = 0; i < excludeList.size(); i++) {
			String str = (String) ipList.get(i);
			if (str.toLowerCase().equals(url.toLowerCase())) {
				return true;
			}
		}
		return false;
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (!isValid) {			
			chain.doFilter(request, response);
			return;
		}
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String referer = httpRequest.getHeader("Referer");
		
		if (isExclude(httpRequest)) {
			chain.doFilter(request, response);
		} else {
			if (null != referer && isValidDomain(referer)) {
				chain.doFilter(request, response);
			} else {
				logger.debug("CSRFFilter,referer=" + referer
						+ ",requestURI()=" + httpRequest.getRequestURI());
				httpResponse.sendRedirect(errorPage);
			}
		}

	}
}
