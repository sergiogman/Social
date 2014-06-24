package twitter4j.profile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import twitter4j.ResponseList;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;

public class StatusServlet extends HttpServlet {
	private static final long serialVersionUID = -7453606094644144082L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Twitter twitter = (Twitter) request.getSession().getAttribute(
				"twitter");
		 ResponseList<Status> posts = null;
		try {
			posts = twitter.getHomeTimeline();
		} catch (TwitterException e) {
			e.printStackTrace();
		}
		request.setAttribute("posts", posts);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/twitter/posts.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}
