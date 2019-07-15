package view;

import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;

import model.PriceDto;
import single.Singleton;

public class PriceView extends JFrame implements WindowListener {
	private JTable jtable;
	private JScrollPane jscrPane;
	String columnNames[] = {
			"Num", "Espresso Beverages", "Short", "Tall", "Grande"
	};
	Object rowData[][];
	DefaultTableModel model; // 테이블의 넓이 설정	
	List<PriceDto> list;
	// CoffeePriceDto에서 list를 생성해서 넘어오기 때문에 여기서 생성 안해도 된다
	
	JLabel label;
	

	public PriceView() {
		setLayout(null);
		
		Singleton s = Singleton.getInstance();
		list = s.priControl.getCoffeePriceList();

		label = new JLabel("커피 가격표");
		label.setBounds(250, 10, 100, 50);
		add(label);
		
		rowData = new Object[list.size()][5];
		// 글의 갯수에 맞게 생성한다		
		
		for(int i = 0; i < list.size(); i++) {
			PriceDto dto = list.get(i);

			rowData[i][0] = dto.getNum(); // 번호
			rowData[i][1] = dto.getCoffee_type(); // 커피명
			rowData[i][2] = dto.getCoff_short(); // Short
			rowData[i][3] = dto.getCoff_tall(); // Tall
			rowData[i][4] = dto.getCoff_grande(); // Grande
		}
			
			
		// 테이블 폭을 설정하기 위한 Model
		model = new DefaultTableModel(columnNames, 0);
		model.setDataVector(rowData, columnNames);
		
		// 테이블 생성
		jtable = new JTable(model);
		
		// column의 폭을 설정
		jtable.getColumnModel().getColumn(0).setMaxWidth(50);
		// 						첫번째 컬럼의 		번호의 폭
		jtable.getColumnModel().getColumn(1).setMaxWidth(400);
		// 						두번째 컬럼의 		커피명의 폭
		jtable.getColumnModel().getColumn(2).setMaxWidth(130);
		// 						세번째 컬럼의 		Short의 폭
		jtable.getColumnModel().getColumn(3).setMaxWidth(130);
		// 						네번째 컬럼의 		Tall의 폭
		jtable.getColumnModel().getColumn(4).setMaxWidth(130);
		// 						다섯번째 컬럼의 		Grande의 폭
		
		
		
		// 테이블의 column의 글의 맞춤(왼쪽, 중간, 오른쪽)
		DefaultTableCellRenderer celAlignCenter = new DefaultTableCellRenderer();
		celAlignCenter.setHorizontalAlignment(JLabel.CENTER); // 중간
		
		// 컬럼은 글의 중간 맞춤이 된다
		jtable.getColumn("Num").setCellRenderer(celAlignCenter);
		jtable.getColumn("Espresso Beverages").setCellRenderer(celAlignCenter);
		jtable.getColumn("Short").setCellRenderer(celAlignCenter);
		jtable.getColumn("Tall").setCellRenderer(celAlignCenter);
		jtable.getColumn("Grande").setCellRenderer(celAlignCenter);
		
		jscrPane = new JScrollPane(jtable);
		jscrPane.setBounds(10, 50, 600, 185);
		add(jscrPane);
		addWindowListener(this);
	
		
		
		
		setBounds(700, 0, 650, 350);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}


	private void windowClosing() {		
	}
	@Override
	public void windowOpened(WindowEvent e) {
	}
	@Override
	public void windowClosing(WindowEvent e) {
		Singleton s = Singleton.getInstance();
		s.coffeePrice = false;
		this.dispose();
	}
	@Override
	public void windowClosed(WindowEvent e) {		
	}
	@Override
	public void windowIconified(WindowEvent e) {
	}
	@Override
	public void windowDeiconified(WindowEvent e) {
	}
	@Override
	public void windowActivated(WindowEvent e) {
	}
	@Override
	public void windowDeactivated(WindowEvent e) {
	}
}
