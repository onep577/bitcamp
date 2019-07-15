package view;

import java.awt.Choice;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;

import dto.BbsDto;
import javabean.BbsDao;

public class bbsListView extends JFrame implements ActionListener, MouseListener {
	private JTable jtable;
	private JScrollPane jscrPane;
	
	String columnNames[] = {
			"번호", "제목", "작성자"
	};
	
	Object rowData[][];
	
	DefaultTableModel model; // 테이블의 넓이 설정
	
	List<BbsDto> list;
	// BbsDto에서 list를 생성해서 넘어오기 때문에 여기서 생성 안해도 된다
	
	Choice ch;
	JButton allBtn, writeBtn; // 글쓰기
	int indexNumber;
	
	// select
	private JComboBox<String> choiceList;
	private JTextField selectField;
	private JButton selectBtn;

	public bbsListView() {
		super("게시판");
		
		setLayout(null);
		
		JLabel label = new JLabel("게시판");
		label.setBounds(10, 10, 120, 15);
		add(label);

		BbsDao dao = BbsDao.getInstance();
		list = dao.getBbsList();
		
		rowData = new Object[list.size()][3];
		// 글의 갯수에 맞게 생성한다		
		
		for(int i = 0; i < list.size(); i++) {
			BbsDto dto = list.get(i);
			
			rowData[i][0] = i+1; // 글 번호
			rowData[i][1] = dto.getTitle(); // 제목
			rowData[i][2] = dto.getId();
			
			if(dto.getDel() == 0) {
				rowData[i][0] = "";
				rowData[i][1] = "  --작성자에 의해 삭제된 글입니다";
				rowData[i][2] = "";
			}
		}
		
		
		
		// 테이블 폭을 설정하기 위한 Model
		model = new DefaultTableModel(columnNames, 0);
		model.setDataVector(rowData, columnNames);
		
		// 테이블 생성
		jtable = new JTable(model);
		
		// column의 폭을 설정
		jtable.getColumnModel().getColumn(0).setMaxWidth(50);
		// 						첫번째 컬럼의 		번호의 폭
		jtable.getColumnModel().getColumn(1).setMaxWidth(500);
		// 						두번째 컬럼의 		글 제목의 폭
		jtable.getColumnModel().getColumn(2).setMaxWidth(200);
		// 						세번째 컬럼의 		작성자의 폭
		
		
		
		// 테이블의 column의 글의 맞춤(왼쪽, 중간, 오른쪽)
		DefaultTableCellRenderer celAlignCenter = new DefaultTableCellRenderer();
		celAlignCenter.setHorizontalAlignment(JLabel.CENTER); // 중간
		
		// 번호와 작성자의 컬럼은 글의 중간 맞춤이 된다
		jtable.getColumn("번호").setCellRenderer(celAlignCenter);
		jtable.getColumn("작성자").setCellRenderer(celAlignCenter);
		jtable.addMouseListener(this);
		
		jscrPane = new JScrollPane(jtable);
		jscrPane.setBounds(10, 50, 600, 300);
		add(jscrPane);
		
		
		
		
		
		allBtn = new JButton("전체보기");
		allBtn.setBounds(400, 370, 100, 30);
		allBtn.addActionListener(this);
		add(allBtn);
		
		writeBtn = new JButton("글쓰기");
		writeBtn.setBounds(510, 370, 100, 30);
		writeBtn.addActionListener(this);
		add(writeBtn);
		
		
		
		
		
		// 검색 
		// Choich(AWT) == JComboBox(swing)
		selectField = new JTextField();
		selectField.setBounds(90, 370, 150, 30);
		add(selectField);
		
		selectBtn = new JButton("search");
		selectBtn.setBounds(250, 370, 100, 30);
		selectBtn.addActionListener(this);
		add(selectBtn);
		
		String[] selects = new String[] { "선택", "제목", "내용", "작성자" };
		choiceList = new JComboBox<String>(selects);
		choiceList.setBounds(10, 370, 70, 30);
		add(choiceList);
		
		
		
		
		
		setBackground(new Color(60,0,30));
		setBounds(100, 100, 640, 480);
		setVisible(true);
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	} // bbsListView 생성자

	@Override
	public void actionPerformed(ActionEvent e) {
		JButton btn = (JButton)e.getSource();
		String btnName = btn.getLabel();
		
		BbsDao dao = BbsDao.getInstance();
		
		if(btnName.equals("글쓰기")) {
			//JOptionPane.showMessageDialog(null, "dd");
			new bbsWriteView();
			this.dispose();
			
		}else if(btnName.equals("search")) {
			// 무엇을 선택
			String selectItem = (String)choiceList.getSelectedItem();
			list = dao.searchBbs2(selectItem, selectField.getText());
			JOptionPane.showMessageDialog(null, selectItem + " : " + selectField.getText());

			if(list.size() == 0 || selectField.getText().equals("")) {
				JOptionPane.showMessageDialog(null, "검색하신 단어로 데이터를 찾지 못했습니다");
				list = dao.getBbsList();
			}

			setList(list);
			
		}else if(btnName.equals("전체보기")) {
			//JOptionPane.showMessageDialog(null, "dd");
			new bbsListView();
			this.dispose();
		}
	} // actionPerformed 함수
	
	public void setList(List<BbsDto> list) {
		rowData = new Object[list.size()][3];
		// 글의 갯수에 맞게 생성한다		
		
		for(int i = 0;i < list.size(); i++) {
			BbsDto dto = list.get(i);
			
			rowData[i][0] = i + 1;	// 글 번호
			if(dto.getDel() == 1) {		// 글제목
				rowData[i][1] = "  ******이 글은 삭제되었습니다*****";
			}else {
				rowData[i][1] = dto.getTitle();
			}
			rowData[i][2] = dto.getId();	// 작성자
		}	
		
		
		model.setDataVector(rowData, columnNames);
		
		jtable.getColumnModel().getColumn(0).setMaxWidth(50);	// 번호
		jtable.getColumnModel().getColumn(1).setMaxWidth(500);	// 글 제목
		jtable.getColumnModel().getColumn(2).setMaxWidth(200);	// 작성자
		
		// 테이블의 column의 글의 맞춤(왼쪽, 중간, 오른쪽)
		DefaultTableCellRenderer celAlignCenter = new DefaultTableCellRenderer();
		celAlignCenter.setHorizontalAlignment(JLabel.CENTER);	// 중간
		
		// 번호와 작성자의 컬럼은 글의 중간 맞춤이 된다
		jtable.getColumn("번호").setCellRenderer(celAlignCenter);
		jtable.getColumn("작성자").setCellRenderer(celAlignCenter);
		
		jtable.setModel(model);		
	} // setList 함수

	@Override
	public void mouseClicked(MouseEvent e) {
	}
	@Override
	public void mousePressed(MouseEvent e) {
		// 마우스 클릭했을 때
		int rowNumber = jtable.getSelectedRow();
		if(list.get(rowNumber).getDel() == 0) {
			JOptionPane.showMessageDialog(null, "삭제된 글입니다");
			return;
		}
		BbsDao dao = BbsDao.getInstance();
		//JOptionPane.showMessageDialog(null, "선택행 : " + rowNumber);
		dao.readCount(list.get(0).getSeq());
		new bbsReadView(list.get(rowNumber).getSeq());
		this.dispose();
	}
	@Override
	public void mouseReleased(MouseEvent e) {		
	}
	@Override
	public void mouseEntered(MouseEvent e) {		
	}
	@Override
	public void mouseExited(MouseEvent e) {
	}
	
}













