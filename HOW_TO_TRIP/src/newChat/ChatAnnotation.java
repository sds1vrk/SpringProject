package newChat;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import java.util.concurrent.CopyOnWriteArraySet;

import java.util.concurrent.atomic.AtomicInteger;



import javax.websocket.OnClose;

import javax.websocket.OnError;

import javax.websocket.OnMessage;

import javax.websocket.OnOpen;

import javax.websocket.Session;

import javax.websocket.server.ServerEndpoint;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

@ServerEndpoint(value ="/broadcasting") //클라이언트가 접속할 때 사용될 URI

public class ChatAnnotation {
	static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());

    @OnOpen
    public void handleOpen(Session userSession){
    	sessionUsers.add(userSession);
 
    }
    @OnClose

    public void end() {

    	sessionUsers.remove(this);

        String message = String.format("%s","has disconnected.");

        broadcast(message);

    }
  // 현재 세션과 연결된 클라이언트로부터 메시지가 도착할 때마다 새로운 쓰레드가 실행되어 incoming()을 호출함

    @OnMessage

    public void incoming(String message, Session userSession) {
    	
    	  /*String username = (String)userSession.getUserProperties().get("id");*/
          //세션 프로퍼티에 username이 없으면 username을 선언하고 해당 세션을으로 메시지를 보낸다.(json 형식이다.)
          //최초 메시지는 username설정
    	  
       /*   if(username == null){
              userSession.getUserProperties().put("username", message);
              try {
				userSession.getBasicRemote().sendText(buildJsonData("System", "you are now connected as " + message));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
              return;
          }
          //username이 있으면 전체에게 메시지를 보낸다.
          Iterator<Session> ss = sessionUsers.iterator();
          while(ss.hasNext()){
              try {
				ss.next().getBasicRemote().sendText(buildJsonData(username,message));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
          }*/
    	  broadcast(message);
    }
    
    @OnError
    public void onError(Throwable t) throws Throwable {
        System.err.println("Chat Error: ");
    }
 
    public String buildJsonData(String username,String message){
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("username", username);
        jsonObject.put("message", message);
        StringWriter stringwriter =  new StringWriter();
        /*try(JsonWriter jsonWriter = Json.createWriter(stringwriter)){
                jsonWriter.write(jsonObject);
        };*/
        return jsonObject.toString();
    }

 
    


    // 현재 세션으로부터 도착한 메시지를 모든 접속자에게 전송한다

   private void broadcast(String msg) {
	   
	  Iterator<Session> ss = sessionUsers.iterator();

	  while(ss.hasNext()) {
		try {
			ss.next().getBasicRemote().sendText(msg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	  }
   }
   
         // 접속 종료
   public void handleClose(Session userSession){
       sessionUsers.remove(userSession);
       broadcast(userSession.toString());
   }
}