package com.sp.Handller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginRedirectHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		
		List<String> roleNames=new ArrayList<String>();
		authentication.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
			System.out.println("==role.authority=="+authority.getAuthority());
		});
		
		if(roleNames.contains("ADMIN")) {
			SecurityContextHolder.getContext().setAuthentication(authentication);
			System.out.println(SecurityContextHolder.getContext().getAuthentication());
//			System.out.println("됐냐? : " + id);
			response.sendRedirect("/ex/success");
			return;
		}
		if(roleNames.contains("MEMBER")) {
			SecurityContextHolder.getContext().setAuthentication(authentication);
			System.out.println(SecurityContextHolder.getContext().getAuthentication());
			response.sendRedirect("/ex/success");
			return;
		}

	}

}









