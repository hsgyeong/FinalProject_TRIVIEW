package sist.last.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;


// Spring Framework 에서 WebSocket을 구성하기 위한 설정 클래스인 'WebSocketConfig' 클래스입니다.
// WebSocket은 양방향 통신을 지원하는 프로토콜로, 주로 실시간 채팅이나 알림 기능을 구현하는데 사용됩니다. 이 클래스는 WebSocket을 활성화 하고 WebSocket 핸들러를 등록하는 역할을 합니다.



// 웹소켓 구현제와 등록할 config 파일 생성
// 구현체를 등록하겠습니다.


@Configuration // 해당 어노테이션은 이 클래스가 스프링 IoC 컨테이너에서 Bean을 정의하는 클래스임을 나타냅니다. 즉, 이 클래스는 애플리케이션 컨텍스트에서 빈으로 사용됩니다.
@EnableWebSocket // WebSocket 기능을 활성화하는 어노테이션입니다. 이를 통해 스프링은 WebSocket을 사용할 수 있도록 설정됩니다.
public class WebSocketConfig implements WebSocketConfigurer{
    // WebSocketConfigurer 인터페이스를 구현함으로써 WebSocket의 구성을 담당합니다. 이 인터페이스는 registerWebSocketHandlers 메서드를 제공하며, 이 메서드에서 WebSocket 핸들러를 등록할 수 있습니다.

    @Autowired
    SocketHandler socketHandler; // SocketHandler 빈을 주입받기 위해 @Autowired 어노테이션을 사용합니다. SocketHandler는 WebSocket 연결 및 메시지 처리를 담당하는 사용자 정의 핸들러입니다.

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) { // 이 메서드는 WebSocket 핸들러를 등록하는 역할을 합니다. WebSocketHandlerRegistry를 통해 핸들러를 등록합니다.
        registry.addHandler(socketHandler,"/chat/chating");
//        registry.addHandler(socketHandler, "/chating/{roomNumber}"); // registry.addHandler(socketHandler, "/chating/{roomNumber}") 코드는 socketHandler를 "/chating/{roomNumber}" 경로에 매핑시킵니다. 여기서 {roomNumber}는 변수로, 채팅방 번호에 해당합니다.
    }
    // 이 설정을 통해 해당 애플리케이션에서 "/chating/{roomNumber}" 경로로 들어오는 WebSocket 연결을 처리하고, SocketHandler에서 정의한 로직을 실행할 수 있게 됩니다. WebSocket을 사용하면 클라이언트와 서버 간에 양방향 통신이 가능해져 실시간 채팅과 같은 기능을 구현할 수 있습니다.
//
//    @Bean
//    public ServletServerContainerFactoryBean createWebSocketContainer() {
//        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
//        container.setMaxTextMessageBufferSize(500000);
//        container.setMaxBinaryMessageBufferSize(500000);
//        return container;
//    }
}
