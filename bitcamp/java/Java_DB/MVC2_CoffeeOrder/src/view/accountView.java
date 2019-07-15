package view;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import model.CustomerDto;
import single.Singleton;

public class accountView extends JFrame implements ActionListener {
	List<CustomerDto> member_list = new ArrayList<CustomerDto>();
	List<JLabel> label_list = new ArrayList<JLabel>();
	List<JTextField> textField_list = new ArrayList<JTextField>();
	
	JLabel label[] = new JLabel[4];
	JTextField textField[] = new JTextField[4];
	JButton check_btn, account_btn;
	
	public accountView() {
		super("회원가입");
		
		setLayout(null);
		
		String title[] = {"ID", "PWD", "NAME", "AGE"};
		for (int i = 0; i < label.length; i++) {
			label[i] = new JLabel(title[i]);
			label[i].setBounds(50, 50 + (100*i), 50, 50);
			add(label[i]);
			label_list.add(label[i]);
		}
		
		for (int i = 0; i < textField.length; i++) {
			textField[i] = new JTextField();
			textField[i].setBounds(150, 50 + (100*i), 150, 50);
			add(textField[i]);
			textField_list.add(textField[i]);
		}
		
		check_btn = new JButton("CHECK");
		account_btn = new JButton("ACCOUNT");
		check_btn.setBounds(350, 50, 100, 50);
		account_btn.setBounds(50, 450, 300, 50);
		check_btn.addActionListener(this);
		account_btn.addActionListener(this);
		add(check_btn);
		add(account_btn);
		

		getContentPane().setBackground(Color.LIGHT_GRAY);
		setBounds(0, 0, 500, 700);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	} // accountView 생성자
	
	@Override
	public void actionPerformed(ActionEvent e) {
		JButton btn = (JButton)e.getSource();
		
		Singleton s = Singleton.getInstance();
		
		if(btn.equals(check_btn)) {
			boolean b = s.cusControl.idCheck(textField[0].getText());
			if(b) {
				JOptionPane.showMessageDialog(null, "중복된 아이디가 있습니다");
			}else {
				JOptionPane.showMessageDialog(null, 
						textField[0].getText() + "는 사용할 수 있는 id입니다");
			}
		}else if(btn.equals(account_btn)) {
			if(textField[0].getText().equals("") ||
					textField[1].getText().equals("") ||
					textField[2].getText().equals("") ||
					Integer.parseInt(textField[3].getText()) == 0 ) {
				JOptionPane.showMessageDialog(null, "모두 기입해주세요");
				return;
			}
			
			s.cusControl.regiAf(textField[0].getText(),
					textField[1].getText(),
					textField[2].getText(),
					Integer.parseInt(textField[3].getText()));
			this.dispose();
			// controller에서 가입 성공하면 로그인으로, 가입 실패하면 지금 창이 다시 나오게 한다
		} // 버튼 이벤트 실행
		
	} // actionPerformed 함수

}



