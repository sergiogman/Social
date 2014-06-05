package facebook4j.profile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.Post;
import facebook4j.Reading;
import facebook4j.ResponseList;

public class StreamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ResponseList<Post> lista = null;

		Facebook facebook = (Facebook) request.getSession().getAttribute(
				"facebook");

		Reading r = new Reading();
		int limit;
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		} else {
			limit = 25;
		}
		r.limit(limit);
		try {
			lista = facebook.getHome(r);
		} catch (FacebookException e) {
			e.printStackTrace();
		}
		request.setAttribute("timeline", lista);
		request.setAttribute("limit", limit + 25);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/facebook/timeline.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
