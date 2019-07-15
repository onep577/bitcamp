
public class Exercise2 {

	public static void main(String[] args) {
		MyTv2 t = new MyTv2();
		// t : 객체(object), 주체(instance) 메모리 위에 올라가는 실제 변수
		
		t.setChannel(10);
		System.out.println("CH : " + t.getChannel());
		t.setVolume(20);
		System.out.println("VOL : " + t.getVolume());
		
		// CH : 10
		// VOL : 20

		t.setChannel(10);
		System.out.println("CH : " + t.getChannel());
		t.setChannel(20);
		System.out.println("CH : " + t.getChannel());
		t.gotoPrevChannel();
		System.out.println("CH : " + t.getChannel());
		t.gotoPrevChannel();
		System.out.println("CH : " + t.getChannel());
		
		/*
		 	CH : 10
		 	CH : 20
		 	CH : 10
		 	CH : 20
		*/

	}
}
