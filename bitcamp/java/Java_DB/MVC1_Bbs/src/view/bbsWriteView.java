package view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import javabean.BbsDao;
import javabean.MemberDao;

public class bbsWriteView extends JFrame implements ActionListener {
	JLabel id_lb, ti_lb, con_lb;
	JTextField id_Tf, ti_Tf;
	JScrollPane jscrPane;
	JTextArea con_Ta;
	JButton writeBtn, listBtn;
	
	public bbsWriteView() {
		super("글쓰기");
		//this._id = _id;
		setLayout(null);
		
		id_lb = new JLabel("ID");
		ti_lb = new JLabel("제목");
		con_lb = new JLabel("내용");
		id_lb.setBounds(50, 50, 50, 50);
		ti_lb.setBounds(50, 150, 50, 50);
		con_lb.setBounds(50, 250, 50, 50);
		add(id_lb);
		add(ti_lb);
		add(con_lb);
		
		MemberDao mem = MemberDao.getInstance();
		
		id_Tf = new JTextField(mem.getLoginId());
		ti_Tf = new JTextField();
		id_Tf.setBounds(150, 50, 250, 50);
		ti_Tf.setBounds(150, 150, 250, 50);
		add(id_Tf);
		add(ti_Tf);
		
		con_Ta = new JTextArea();
		
		jscrPane = new JScrollPane(con_Ta);
		jscrPane.setBounds(50, 350, 350, 200);
		add(jscrPane);
		
		writeBtn = new JButton("글추가");
		writeBtn.setBounds(50, 600, 100, 50);
		writeBtn.addActionListener(this);
		add(writeBtn);
		
		listBtn = new JButton("글목록");
		listBtn.setBounds(300, 600, 100, 50);
		listBtn.addActionListener(this);
		add(listBtn);
		
		setBounds(0, 0, 500, 800);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		JButton btn = (JButton)e.getSource();
		String btnName = btn.getLabel();
		
		BbsDao dao = BbsDao.getInstance();
		
		if(btnName.equals("글추가")) {
			//JOptionPane.showMessageDialog(null, "r");
			boolean b = dao.writeBbs(id_Tf.getText(), ti_Tf.getText(), con_Ta.getText());
			
			if(b) {
				JOptionPane.showMessageDialog(null, "추가성공");
				new bbsListView();
				this.dispose();
			}else {
				JOptionPane.showMessageDialog(null, "추가실패");
			}
		}else if(btnName.equals("글목록")) {
			new bbsListView();
			this.dispose();
		}
		
	} // actionPerformed 함수

}
