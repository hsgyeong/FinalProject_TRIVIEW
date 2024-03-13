package sist.last.chat;
public class Room {
    int roomNumber;
    String senderId;

    public int getRoomNumber() { // 방 번호를 반환하는 메서드 입니다.
        return roomNumber;
    }
    public void setRoomNumber(int roomNumber) { // 방 번호를 설정하는 메서드입니다.
        this.roomNumber = roomNumber;
    }
    public String getsenderId() { // 방 이름을 반환하는 메서드 입니다.
        return senderId;
    }
    public void setsenderId(String senderId) { // 방 이름을 설정하는 메서드입니다.
        this.senderId = senderId;
    }

    // 이러한 메서드를 통해 멤버 변수에 접근할 때 캡슐화를 유지하고, 외부에서 직접적인 접근을 피할 수 있습니다.

    @Override
    public String toString() { // 객체를 문자열로 변환하여 반환하는 메서드를 재정의하고 있습니다. 이 메서드는 객체를 문자열로 표현할 때 사용됩니다. 현재 방의 번호와 이름을 가지고 있는 문자열을 반환하도록 구현되어 있습니다.
        return "Room [roomNumber=" + roomNumber + ", senderId=" + senderId + "]";
    } // toString() 메서드는 객체의 문자열 표현을 반환합니다. 이 메서드를 재정의하여 객체를 문자열로 표현할 때 사용됩니다.

    // ChatRoom 클래스는 방의 번호와 이름을 나타내는 데이터 모델로 사용될 수 있습니다.
    //멤버 변수는 private으로 선언되어 외부에서 직접 접근되지 않고 게터와 세터를 통해 접근됩니다.
    //toString 메서드를 재정의함으로써 객체를 문자열로 표현할 때 사용자가 읽기 쉬운 형태로 출력됩니다.
    //이 클래스는 주로 방 정보를 담는 데이터 모델로 활용될 수 있습니다.

    // 예시 :

//    Room chatRoom = new Room();
//    chatRoom.setRoomNumber(1);
//    chatRoom.setsenderId("General Room");
//
//    System.out.println(chatRoom.toString());
//    // 출력: Room [roomNumber=1, senderId=General Room]
    // 이 클래스는 객체 지향 프로그래밍의 원칙을 따라 작성되어 있으며, 채팅 어플리케이션에서 방 정보를 효과적으로 표현할 수 있도록 설계되었습니다.
}