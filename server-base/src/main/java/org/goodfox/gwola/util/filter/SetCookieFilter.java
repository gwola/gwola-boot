package org.goodfox.gwola.util.filter;

import org.goodfox.gwola.util.http.CookieUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SetCookieFilter implements Filter {

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        CookieUtils.getCookieValueIfNullThenSetCookie(request, response);
        chain.doFilter(request, resp);
    }

    @Override
    public void init(FilterConfig config) {

    }

}