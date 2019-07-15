package view;

import java.awt.Button;
import java.awt.Frame;
import java.awt.Label;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.Random;

import javax.swing.JOptionPane;

public class WindowGame extends Frame implements WindowListener, ActionListener {
	// ActionListener 버튼에 대한 리스너. 버튼 눌렸니?
	Label label;
	Button button1, button2;
	TextField textfield;
	int r_num;
	
	public WindowGame() {
		super("Game"); // 프레임 제목명
		setLayout(null); // 레이아웃 권장
		
		RandomNumber(); // WindowGame을 처음 생성하면서 동시에 랜덤값 만들어진다
		
		textfield = new TextField();
		textfield.setBounds(50, 50, 300, 50);
		add(textfield);
		
		label = new Label();
		label.setText("");
		label.setBounds(50, 150, 300, 50);
		add(label);
		
		button1 = new Button("검사");
		button1.setBounds(50, 250, 300, 50);
		button1.addActionListener(this);
		add(button1);
		
		button2 = new Button("Restart");
		button2.setBounds(50, 350, 300, 50);
		button2.addActionListener(this);
		add(button2);
		
		setLocation(0, 0); // 프레임 시작 위치
		setSize(640, 480); // 프레임 크기
		setVisible(true); // 시각화
		
		addWindowListener(this); // 프레임 듣고있니?
	} // WindowCounterGame 생성자
	
	public void RandomNumber(){
		r_num = (int)(Math.random() * 81) + 20; // 20 ~ 100
		System.out.println("r_num : " + r_num);
	} // RandomNumber 함수
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// 액션리스너의 오버라이딩 메소드이다
		Button btn = (Button)e.getSource();
		// 클릭한 버튼(이벤트)의 정보를 가져온다
		String btnName = btn.getLabel();
		// btnName은 버튼을 생성할 때 생성자 괄호안에 넣은 이름이 나온다
		int button_num = 0;
		
		if(btnName.equals("검사")) {
			String bu_str = textfield.getText();
			// 텍스트필드에 입력한 값을 가져온다
			
			if(!bu_str.equals("")) {
			button_num = Integer.parseInt(bu_str);
	
				if(button_num > 0 && button_num < 11) {
					// 입력한 값이 있고 숫자가 1 ~ 10일 때
					r_num = r_num - button_num;
					System.out.println("r_num : " + r_num);
					
					if(r_num > 0) {
						label.setText("통과");
						JOptionPane.showMessageDialog(null, "통과");
					
					}else {
						label.setText("벌칙");
						textfield.setText("");
						JOptionPane.showMessageDialog(null, "벌칙");
					}
					
				}else {
					// 입력한 값이 1 ~ 10이 아닐 때
					label.setText("1~10 까지의 숫자를 입력해주세요");
					JOptionPane.showMessageDialog(null,
							"1~10 까지의 숫자를 입력해주세요");
				}
			}else {
				label.setText("입력값이 없습니다. 1~10 까지의 숫자를 입력해주세요");
				JOptionPane.showMessageDialog(null,
						"입력값이 없습니다. 1~10 까지의 숫자를 입력해주세요");
			}
		} // if "검사" 버튼을 클릭했을 때
		
		
		if(btnName.equals("Restart")) {
			label.setText("");
			textfield.setText("");
			RandomNumber();
		}
	} // actionPerformed 함수
	
	@Override
	public void windowActivated(WindowEvent e) {
	}
	@Override
	public void windowClosed(WindowEvent e) {
	}
	@Override
	public void windowClosing(WindowEvent e) {
		System.exit(0); // 프로그램 종료
	}
	@Override
	public void windowDeactivated(WindowEvent e) {
	}
	@Override
	public void windowDeiconified(WindowEvent e) {
	}
	@Override
	public void windowIconified(WindowEvent e) {
	}
	@Override
	public void windowOpened(WindowEvent e) {
	}
}
