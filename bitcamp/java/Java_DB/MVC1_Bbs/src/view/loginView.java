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
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import dto.MemberDto;
import javabean.BbsDao;
import javabean.MemberDao;

public class loginView extends JFrame implements ActionListener {

	List<MemberDto> m_list = new ArrayList<MemberDto>();
	
	JLabel id_Lb, pwd_Lb;
	JTextField id_Tf;
	JPasswordField pwd_Tf;
	JButton login_btn, account_btn;
	BbsDao dao = BbsDao.getInstance();
	
	public loginView() {
		super("로그인");
		
		setLayout(null);
		
		id_Lb = new JLabel("ID");
		pwd_Lb = new JLabel("PWD");
		id_Lb.setBounds(50, 50, 50, 50);
		pwd_Lb.setBounds(50, 150, 50, 50);
		add(id_Lb);
		add(pwd_Lb);
		
		id_Tf = new JTextField();
		pwd_Tf = new JPasswordField();
		id_Tf.setBounds(150, 50, 150, 50);
		pwd_Tf.setBounds(150, 150, 150, 50);
		add(id_Tf);
		add(pwd_Tf);
		
		login_btn = new JButton("LOGIN");
		account_btn = new JButton("ACCOUNT");
		login_btn.setBounds(50, 250, 100, 50);
		account_btn.setBounds(200, 250, 100, 50);
		login_btn.addActionListener(this);
		account_btn.addActionListener(this);
		add(login_btn);
		add(account_btn);

		getContentPane().setBackground(Color.LIGHT_GRAY);
		setBounds(0, 0, 400, 400);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		JButton btn = (JButton)e.getSource();
		String btnName = btn.getLabel();
		
		MemberDao dao = MemberDao.getInstance();
		// MemberDao를 리턴한다. 싱글톤
		
		if(btnName.equals("LOGIN")) {
			//JOptionPane.showMessageDialog(null, "LOGIN");
			// 아이디와 비밀번호가 없을 때 입력하라고 뜬다
			if(id_Tf.getText().equals("") || pwd_Tf.getText().equals("")) {
				JOptionPane.showMessageDialog(null, "아이디와 비밀번호를 입력하세요");
			}
			else {
				// 아이디와 비밀번호가 맞는지 Dao에서 확인한다
				String re_id = dao.login(id_Tf.getText(), pwd_Tf.getText());
				// 맞으면 로그인 된 아이디를 Dao에 넣는다 (MemberDao 에서 직접 처리했다)
				// 맞으면 게시판으로 이동
				System.out.println("re_id : " + re_id);
				if(re_id == null) {
					JOptionPane.showMessageDialog(null, "아이디나 비밀번호를 다시 확인해주세요");
					return;
				}else {
					JOptionPane.showMessageDialog(null, re_id + "님 환영합니다");
					new bbsListView();
					this.dispose();
				}
			}
		} else if(btnName.equals("ACCOUNT")){
			//JOptionPane.showMessageDialog(null, "ACCOUNT");
			new accountView();
			this.dispose();
		}
	} // actionPerformed 함수

}











