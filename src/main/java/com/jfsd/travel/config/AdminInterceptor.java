package com.jfsd.travel.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false); // get session if it exists
        boolean isAdminLoggedIn = (session != null && session.getAttribute("admin") != null);

        if (!isAdminLoggedIn) {
            // Redirect to login page if not logged in
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return false;
        }

        return true; // Let the request proceed
    }
}
