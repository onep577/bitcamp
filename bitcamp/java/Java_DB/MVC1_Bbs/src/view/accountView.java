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

import dto.MemberDto;
import javabean.MemberDao;

public class accountView extends JFrame implements ActionListener {

	List<MemberDto> member_list = new ArrayList<MemberDto>();
	List<JLabel> label_list = new ArrayList<JLabel>();
	List<JTextField> textField_list = new ArrayList<JTextField>();
	JLabel label[] = new JLabel[4];
	JTextField textField[] = new JTextField[4];
	JButton check_btn, account_btn;
	
	public accountView() {
		super("회원가입");
		
		setLayout(null);
		
		String title[] = {"ID", "PWD", "NAME", "Email"};
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
		
		getContentPane().setBackground(new Color(20, 222, 133));
		setBounds(0, 0, 500, 700);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	} // accountView 생성자
	
	@Override
	public void actionPerformed(ActionEvent e) {
		JButton btn = (JButton)e.getSource();
		MemberDao dao = MemberDao.getInstance();	
		
		if(btn.equals(check_btn)) {
			//JOptionPane.showMessageDialog(null, "1");
			if(textField[0].getText().equals("")) {
				JOptionPane.showMessageDialog(null, "id를 입력하세요");
				return;
			}
			
			boolean b = dao.getId(textField[0].getText());
			if(b) {
				JOptionPane.showMessageDialog(null, "중복된 아이디가 있습니다");
			}else {
				JOptionPane.showMessageDialog(null, 
						textField[0].getText() + "는 사용할 수 있는 id입니다");
			}
		}else if(btn.equals(account_btn)) {
			//JOptionPane.showMessageDialog(null, "2");
			
			if(textField[0].getText().equals("") || 
				textField[1].getText().equals("") || 
				textField[2].getText().equals("") || 
				textField[3].getText().equals("")) {
				JOptionPane.showMessageDialog(null, "모두 기입해 주세요");
				return;
			}
			
			boolean b = dao.addMember(textField[0].getText(), textField[1].getText(),
							textField[2].getText(), textField[3].getText());
			if(b) {
				JOptionPane.showMessageDialog(null, "가입 성공");
				new loginView();
				this.dispose();
			}else {
				JOptionPane.showMessageDialog(null, "가입 실패");
			}
			
		} // 버튼 이벤트 실행
		
	} // actionPerformed 함수

}









