package com.jfsd.travel.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AdminInterceptor())
            .addPathPatterns("/admin/**") // apply to all admin URLs
            .excludePathPatterns("/admin/login", "/admin/logout", "/admin/login", "/admin/logout"); // allow login/logout pages
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Serve images from the static images directory
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:src/main/resources/static/images/");
    }
}