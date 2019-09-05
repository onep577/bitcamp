package bit.com.a.websock;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocket extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	public WebSocket() {
		System.out.println("EchoHandler 생성됨 : " + new Date());
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 연결된 후에 실행
		System.out.println("연결됨 : " + new Date());
		
		// 일반 세션이 아니라 websocket 세션이다
		users.put(session.getId(), session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결 종료되었을 때 실행
		System.out.println("연결 종료 : " + new Date());
		
		users.remove(session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 메시지 수신되었을 때 실행
		System.out.println("메시지 수신 : " + new Date());
		
		for(WebSocketSession s : users.values()) {
			s.sendMessage(message);
			
			System.out.println(s.getId() + "에 메시지 발송");
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// 예외가 발생했을 때 실행
		System.out.println(session.getId() + "에 메시지 발송");
	}
	
	

}
