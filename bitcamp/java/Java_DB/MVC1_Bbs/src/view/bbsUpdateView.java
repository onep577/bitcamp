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

public class bbsUpdateView extends JFrame implements ActionListener {
	int rowNumber;

	List<BbsDto> list;
	
	JLabel label[] = new JLabel[5];
	JTextField textField[] = new JTextField[4];
	JScrollPane jscrPane;
	JTextArea content_Ta;
	JButton btn[] = new JButton[2];
	
	public bbsUpdateView(int rowNumber) {
		super("글 수정");
		this.rowNumber = rowNumber;
		setLayout(null);
		
		BbsDao dao = BbsDao.getInstance(); // 싱글톤 생성
		list = dao.getBbsList(); // DB에서 데이터를 취득
		

		String t[] = { "ID", "작성일", "조회수", "제목", "내용" };
		for(int i = 0; i < t.length; i++) {
			label[i] = new JLabel(t[i]);
			label[i].setBounds(50, 50 + (70*i), 50, 50);
			add(label[i]);
		}

		textField[0] = new JTextField(list.get(rowNumber).getId());
		textField[1] = new JTextField(list.get(rowNumber).getWdate());
		textField[2] = new JTextField(list.get(rowNumber).getReadcount()+"");
		textField[3] = new JTextField(list.get(rowNumber).getTitle());
		
		for(int i = 0; i < textField.length; i++) {
			textField[i].setBounds(150, 50 + (70 * i), 250, 50);
			add(textField[i]);
		}
		textField[0].disable();
		textField[1].disable();
		textField[2].disable();
		
		content_Ta = new JTextArea(list.get(rowNumber).getContent());
		
		jscrPane = new JScrollPane(content_Ta);
		jscrPane.setBounds(50, 400, 350, 200);
		add(jscrPane);
		
		String tt[] = { "글 목록", "수정완료"};
		for (int i = 0; i < tt.length; i++) {
			btn[i] = new JButton(tt[i]);
			btn[i].setBounds(50 + (125 * i), 655, 100, 50);
			btn[i].addActionListener(this);
			add(btn[i]);
		}
		
		setBounds(0, 0, 500, 800);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		JButton jbtn = (JButton)e.getSource();
		String jbtnName = jbtn.getLabel();
		
		BbsDao dao = BbsDao.getInstance();
		boolean b = false;
		
		if(jbtnName.equals("글 목록")) {
			new bbsListView();
			this.dispose();
		}else if(jbtnName.equals("수정완료")) {
			//JOptionPane.showMessageDialog(null, "수정완료 되었습니다");
			b = dao.updateBbs(textField[3].getText(),
				content_Ta.getText(), list.get(rowNumber).getSeq());
			
			if(b) {
				JOptionPane.showMessageDialog(null, "수정 성공");
				new bbsListView();
				this.dispose();
			}else {
				JOptionPane.showMessageDialog(null, "수정 실패");
			}
		}
		
	} // actionPerformed 함수

}
