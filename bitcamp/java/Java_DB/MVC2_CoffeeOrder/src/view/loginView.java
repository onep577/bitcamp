package view;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import model.CustomerDto;
import single.Singleton;

public class loginView extends JFrame implements ActionListener {
	List<CustomerDto> cus_list = new ArrayList<CustomerDto>();
	
	JLabel id_Lb, pwd_Lb;
	JTextField id_Tf;
	JPasswordField pwd_Tf;
	JButton login_btn, account_btn;
	
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

		
		getContentPane().setBackground(new Color(20, 222, 133));
		setBounds(0, 0, 400, 400);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		JButton btn = (JButton)e.getSource();
		String btnName = btn.getLabel();

		Singleton s = Singleton.getInstance();
		
		if(btnName.equals("LOGIN")) {
			s.cusControl.loginAf(id_Tf.getText(), pwd_Tf.getText());
		}else if(btnName.equals("ACCOUNT")){
			// singleton -> controller -> accountView
			s.cusControl.account();
		}
		
		this.dispose();
	} // actionPerformed 함수

}


