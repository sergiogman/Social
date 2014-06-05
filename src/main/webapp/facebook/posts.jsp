<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="facebook4j.*"%>
<%
	ResponseList<Post> lista = (ResponseList<Post>) request
			.getAttribute("posts");

	for (Post pp : lista) {
		Date hoy = new Date();
		Date horaPost = pp.getUpdatedTime();
		long miliPost = horaPost.getTime();
		long miliHoy = hoy.getTime();

		long tiempoPost = (miliHoy - miliPost) / (60 * 60 * 1000);
		String tiempoMensaje = "horas";
		if (tiempoPost > 24) {
			tiempoPost = (miliHoy - miliPost) / (24 * 60 * 60 * 1000);
			tiempoMensaje = "d&iacute;as";
		}
%>
<div class="estado">
	<p class="uno"><%=pp.getFrom().getName()%></p>
	<p class="mensaje_time">
		Hace
		<%=tiempoPost%>
		<%=tiempoMensaje%>
	</p>
	<p class="mensaje"><%=pp.getMessage()%></p>
	<div class="comentarios">
		<%
			PagableList<Comment> comentarios = pp.getComments();
				for (Comment cc : comentarios) {
					Date horaComment = cc.getCreatedTime();
					long miliComment = horaComment.getTime();

					long tiempoComentario = (miliHoy - miliComment)
							/ (60 * 60 * 1000);
					tiempoMensaje = "horas";

					if (tiempoComentario > 24) {
						tiempoComentario = (miliHoy - miliComment)
								/ (24 * 60 * 60 * 1000);
						tiempoMensaje = "d&iacute;as";
					}
		%>
		<p class="uno"><%=cc.getFrom().getName()%>:
		</p>
		<p class="mensaje_time">
			Hace
			<%=tiempoComentario%>
			<%=tiempoMensaje%>
		</p>
		<p class="mensaje"><%=cc.getMessage()%></p>
		<%
			}
		%>
	</div>
</div>
<%
	}
%>
<style>
.estado {
	background: #FFF;
	border: 1px solid #000;
}

.uno {
	padding: 0;
	margin-bottom: 0px;
}

.mensaje_time {
	padding: 0;
	margin-top: 0px;
	font-size: 12px;
}

.mensaje {
	
}

.comentarios {
	background: #CCC;
}

.comentario {
	border-bottom: 1px solid #000;
}
</style>