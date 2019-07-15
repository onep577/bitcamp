package view;

import java.awt.Button;
import java.awt.Frame;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

import javax.swing.JOptionPane;

public class WindowCount extends Frame implements WindowListener, ActionListener {
	Label label;
	Button button1, button2, button3;
	String str = "0";
	
	public WindowCount() {
		super("Counter"); // 프레임의 제목명
		setLayout(null); // 레이아웃의 권장은 null이다
		
		label = new Label();
		label.setText(str); // str은 레이블 위에 나오는 문자열이다
		label.setBounds(30, 70, 600, 100);
		add(label);
		
		button1 = new Button("+");
		button1.setBounds(50, 200, 130, 50);
		button1.addActionListener(this);
		add(button1);
		
		button2 = new Button("-");
		button2.setBounds(220, 200, 130, 50);
		button2.addActionListener(this);
		add(button2);
		
		button3 = new Button("reset");
		button3.setBounds(50, 300, 300, 50);
		button3.addActionListener(this);
		add(button3);
		
		setSize(640, 480); // 프레임 사이즈
		setLocation(0, 0); // 프레임 시작 위치
		setVisible(true); // 시각화
		addWindowListener(this); // 프레임 듣고있니? this는 프레임
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		Button btn = (Button)e.getSource();
		String btnName = btn.getLabel();
		
		if(btnName.equals("+")) { // + 클릭
			int i1 = Integer.parseInt(str) + 1; // 1 증가
			str = i1+"";
			label.setText(str); // 1 증가한 숫자를 label에 넣는다
		}else if(btnName.equals("-")) { // - 클릭
			int i2 = Integer.parseInt(str) - 1; // 1 감소
			if(i2 < 0) {
				JOptionPane.showMessageDialog(null, "끝입니다");
			}else if(i2 >= 0) {
				str = i2+"";
				label.setText(str); // 1 감소한 숫자를 label에 넣는다
			}
		}else if(btnName.equals("reset")) { // reset 클릭
			str = 0+"";
			label.setText(str); // 처음부터니까 label에 0을 넣는다
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
