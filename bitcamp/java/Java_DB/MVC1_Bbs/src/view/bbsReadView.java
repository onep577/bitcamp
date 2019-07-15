package view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import dto.BbsDto;
import javabean.BbsDao;
import javabean.MemberDao;

public class bbsReadView extends JFrame implements ActionListener {
	int seq;
	int findIndex;
	List<BbsDto> list;
	
	JLabel label[] = new JLabel[5];
	JTextField textField[] = new JTextField[4];
	JScrollPane jscrPane;
	JTextArea content_Ta;
	JButton btn[] = new JButton[3];
	
	public bbsReadView(int seq) {
		super("글읽기");
		setLayout(null);
		
		this.seq = seq;

		BbsDao dao = BbsDao.getInstance(); // 싱글톤 생성
		list = dao.getBbsList(); // DB에서 데이터를 취득		
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getSeq() == seq) {
				findIndex = i;
			}
		}

		
		String t[] = { "ID", "작성일", "조회수", "제목", "내용" };
		for(int i = 0; i < t.length; i++) {
			label[i] = new JLabel(t[i]);
			label[i].setBounds(50, 50 + (70*i), 50, 50);
			add(label[i]);
		}		
		
		textField[0] = new JTextField(list.get(findIndex).getId());
		textField[1] = new JTextField(list.get(findIndex).getWdate());
		textField[2] = new JTextField(list.get(findIndex).getReadcount()+"");
		textField[3] = new JTextField(list.get(findIndex).getTitle());
		
		for(int i = 0; i < textField.length; i++) {
			textField[i].setBounds(150, 50 + (70 * i), 250, 50);
			textField[i].disable();
			add(textField[i]);
		}
		
		content_Ta = new JTextArea(list.get(findIndex).getContent());
		content_Ta.disable();
		
		jscrPane = new JScrollPane(content_Ta);
		jscrPane.setBounds(50, 400, 350, 200);
		add(jscrPane);
		
		String tt[] = { "글 목록", "수정", "삭제완료" };
		for (int i = 0; i < tt.length; i++) {
			btn[i] = new JButton(tt[i]);
			btn[i].setBounds(50 + (125 * i), 655, 100, 50);
			btn[i].addActionListener(this);
			add(btn[i]);
		}

		MemberDao m_dao = MemberDao.getInstance();
		if(! m_dao.getLoginId().equals(list.get(findIndex).getId()) ) {
			btn[1].setEnabled(false);
			btn[2].setEnabled(false);
		}
		
		setBounds(0, 0, 500, 800);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	} // bbsReadView 생성자

	@Override
	public void actionPerformed(ActionEvent e) {
		JButton jbtn = (JButton)e.getSource();
		String jbtnName = jbtn.getLabel();
		
		BbsDao dao = BbsDao.getInstance();
		MemberDao m_dao = MemberDao.getInstance();
		boolean b = false;
		
		if(jbtnName.equals("글 목록")) {
			new bbsListView();
			this.dispose();
		}else if(jbtnName.equals("수정")) {
			new bbsUpdateView(findIndex);
			this.dispose();
		}else if(jbtnName.equals("삭제완료")) {
			b = dao.deleteBbs(seq);
			if(b) {
				JOptionPane.showMessageDialog(null, "삭제 성공");
				new bbsListView();
				this.dispose();
			}else {
				JOptionPane.showMessageDialog(null, "삭제 실패");
			}
		} // 수정 삭제
				
	} // actionPerformed 함수

}
