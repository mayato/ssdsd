package com.cn.hnust.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.util.LoggerUtil;

/**
 * 登录拦截器
 * 
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession httpSession = request.getSession();
		String userId = (String) httpSession.getAttribute("aname");
		if (userId == null) {
			String path = request.getServletPath();
			String ip = request.getRemoteAddr();
			LoggerUtil.info("IP(" + ip + ") 未登录访问 " + path);

			String contextPath = request.getSession().getServletContext().getContextPath();
			String method = request.getMethod();
			if (method.equals("GET")) {
				response.sendRedirect(contextPath + "/admin/login");
			} else {
				response.sendRedirect(contextPath + "/admin/login");
			}
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
