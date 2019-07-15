
public class MyTv2 {
	private boolean isPowerOn;
	private int channel;
	private int volume = 0;
	private int prev_Channel;
	
	final int Max_VOLUME = 100; // 상수 == 정의 == 변할 수 없는 수
	final int MIN_VOLUME = 0;	// C++ 에선 const int number; 라고 말한다
	final int MAX_CHANNEL = 100;
	final int MIN_CHANNEL = 1;
	
	public void setIsPowerOn(boolean isPowerOn) {
		this.isPowerOn = isPowerOn;
	}
	
	public boolean getIsPowerOn() {
		return this.isPowerOn;
	}
	
	public void setChannel(int cha) {
		prev_Channel = this.channel; // 바뀌기 전에 저장
		this.channel = cha;
	}
	
	public int getChannel() {
		return this.channel;
	}
	
	public void setVolume(int volume) {
		this.volume = volume;
	}
	
	public int getVolume() {
		return this.volume;
	}
	
	
	// 현재 채널을 이전 채널로 변경한다
	public void gotoPrevChannel() {
		setChannel(this.prev_Channel);
	}
	
	
}
