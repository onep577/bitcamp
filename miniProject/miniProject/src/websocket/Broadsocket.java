package websocket;


import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting") //클라이언트가 접속할 때 사용될 URI
public class Broadsocket {
	
	private static final String GUEST_PREFIX = "Guest";
	
	// AtomicInteger 클래스는 getAndIncrement()를 호출할 때마다 카운터를 1씩 증가하는 기능을 가지고 있다
    private static final AtomicInteger connectionIds = new AtomicInteger(0);
	
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	
    
    
    
	//서버로부터 데이터를 전송받을 경우 동작할 메소드
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		
		// 하나의 일처리를 수행하는 동안 사용자의 변경이 일어나면 안되므로 NullPointer를 방지하기 위해 동기화 처리
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	
	//서버 연결한 시점에 동작하는 메소드
	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);	//접속 세션주소
		//clients.add(session);
		
		// 1:1 접속만을 위한 조건추가
		//if(clients == null) {
			clients.add(session);
		//}else 
		
	}
	
	// Set<> 에 이미나간 사용자를 삭제시킨다. (세션 남아있을경우 메세지 전송 에러발생)
	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
		
	}
	
	
	
	
}