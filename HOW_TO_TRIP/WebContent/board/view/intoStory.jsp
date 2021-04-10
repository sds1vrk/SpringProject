<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="org.json.simple.JSONObject,java.io.PrintWriter,java.util.*,java.io.PrintWriter,story.*"%>
<%
String storyno=request.getParameter("storyno");

System.out.println(storyno);
StoryDAO dao=new StoryDAO();
List<SnapVO> slist=dao.snapAllData(Integer.parseInt(storyno));
for(SnapVO vo:slist) {
	vo.setClist(dao.getComment(vo.getSnapno()));
}
int snapno=slist.get(0).getSnapno();
%>
<%
	int index=0;
	for(SnapVO svo:slist) {
%>		
	
		<div>
			<div style="float:left;">
				<img src="<%=svo.getPath()%>" style="margin-left:0px !important;padding-left:0px !important; width:500px; height:500px; ">
				<br/><p align="left"><%=svo.getSnapcontent() %></p>
			</div>
			<div style=" float:left; margin-left:0px;">
				<table id="snap_<%=svo.getSnapno()%>">
					<%
						for(int i=0; i<svo.getClist().size(); i++) {
							%>
							<tr style="margin-top: 2; margin-left: 0;">
								<td>
									<b><%=svo.getClist().get(i).getId() %></b>
									&nbsp;&nbsp;
									<%=svo.getClist().get(i).getCommentContent() %>
								</td>
							</tr>
							<%
						}
					%>
				</table>
			</div>
			<hr/>
			<div style="position: absolute; top: 520px; left: 530px;">			
				<form id=<%=index%>>
					<input type="text" placeholder="��۴ޱ�.." 
					name="comment" size="20" align="center" required>
					<input type="hidden" name="storyno" value=<%=storyno %>>
					<input type="hidden" name="snapno" value=<%=svo.getSnapno() %>>
					<input type="button" class="btn" value="��۴ޱ�">
				</form>
			</div>
		</div>
<%
	index++;
	}
%>

<script type="text/javascript">
$('.btn').click(function(){
	var index=parseInt($(this).parent('form').attr("id"));
	$.ajax({
		url: "comment.jsp",
		type:'post',
		data: $(document.forms[index]).serialize(),
		dataType: 'json',
		success : function(data) {
			var cid=data.comm.id;
			var content=data.comm.comment;
			var sno=data.comm.snapno;
			$("<tr><td><b>"+cid+"</b>"+content+"</td></tr>").appendTo($('#snap_'+data.comm.snapno));
		},
		error : function(data){
			alert("����");
		}
		});
	});

</script>	