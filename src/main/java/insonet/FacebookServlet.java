package insonet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.Post;
import facebook4j.ResponseList;

public class FacebookServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Facebook facebook = new FacebookFactory().getInstance();
		request.getSession().setAttribute("facebook", facebook);

		signin(request, response);
		status(request, response);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/facebook/panel.jsp");
		dispatcher.forward(request, response);
	}

	protected void signin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Facebook facebook = (Facebook) request.getSession().getAttribute(
				"facebook");
		request.getSession().setAttribute("facebook", facebook);
		StringBuffer callbackURL = request.getRequestURL();
		int index = callbackURL.lastIndexOf("/");
		callbackURL.replace(index, callbackURL.length(), "")
				.append("/callback");

		RequestDispatcher dispatcher = request.getRequestDispatcher(facebook
				.getOAuthAuthorizationURL(callbackURL.toString()));
		dispatcher.forward(request, response);

	}

	protected void status(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Facebook facebook = (Facebook) request.getSession().getAttribute(
				"facebook");
		ResponseList<Post> posts = null;
		try {
			posts = facebook.getStatuses();
		} catch (FacebookException e) {
			e.printStackTrace();
		}
		request.setAttribute("posts", posts);

		// RequestDispatcher dispatcher = request
		// .getRequestDispatcher("/facebook/posts.jsp");
		// dispatcher.forward(request, response);
	}
}
