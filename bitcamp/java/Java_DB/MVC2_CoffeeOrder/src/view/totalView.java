package view;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;

import model.OrderDto;
import single.Singleton;

public class totalView extends JFrame {
	private JTable jtable;
	private JScrollPane jscrPane;
	String columnNames[] = {
			"주문자", "coffee", "크기", "시럽", "샷추가", "휘핑크림", "잔", "총액"
	};
	Object rowData[][];
	DefaultTableModel model; // 테이블의 넓이 설정	
	List<OrderDto> list;
	// CoffeePriceDto에서 list를 생성해서 넘어오기 때문에 여기서 생성 안해도 된다
	
	public totalView() {
		super("주문내역");	
		
		Singleton s = Singleton.getInstance();
		list = s.orderControl.getTotal();
		
		rowData = new Object[list.size()][8];
		// 글의 갯수에 맞게 생성한다
		
		for(int i = 0; i < list.size(); i++) {
			OrderDto dto = list.get(i);

			rowData[i][0] = dto.getId(); // 주문자
			rowData[i][1] = dto.getCoffee_type(); // 커피명
			rowData[i][2] = dto.getCoffee_size(); // 크기
			rowData[i][3] = dto.getCoffee_syrup(); // 시럽
			rowData[i][4] = dto.getCoffee_shot(); // 샷추가
			rowData[i][5] = dto.getCoffee_whip(); // 휘핑크림
			rowData[i][6] = dto.getCoffee_number(); // 잔
			rowData[i][7] = dto.getCoffee_totalPrice(); // 총액
		}
		/**/
			
			
		// 테이블 폭을 설정하기 위한 Model
		model = new DefaultTableModel(columnNames, 0);
		model.setDataVector(rowData, columnNames);
		
		// 테이블 생성
		jtable = new JTable(model);
		
		// column의 폭을 설정
		jtable.getColumnModel().getColumn(0).setMaxWidth(50);
		// 						첫번째 컬럼의 		커피명의 폭
		jtable.getColumnModel().getColumn(1).setMaxWidth(200);
		// 						첫번째 컬럼의 		커피명의 폭
		jtable.getColumnModel().getColumn(2).setMaxWidth(100);
		// 						두번째 컬럼의 		크기의 폭
		jtable.getColumnModel().getColumn(3).setMaxWidth(100);
		// 						세번째 컬럼의 		시럽의 폭
		jtable.getColumnModel().getColumn(4).setMaxWidth(70);
		// 						네번째 컬럼의 		샷추가의 폭
		jtable.getColumnModel().getColumn(5).setMaxWidth(70);
		// 						다섯번째 컬럼의 		휘핑크림의 폭
		jtable.getColumnModel().getColumn(6).setMaxWidth(60);
		// 						여섯번째 컬럼의 		잔의 폭
		jtable.getColumnModel().getColumn(7).setMaxWidth(100);
		// 						일곱번째 컬럼의 		총액의 폭
		
		
		
		// 테이블의 column의 글의 맞춤(왼쪽, 중간, 오른쪽)
		DefaultTableCellRenderer celAlignCenter = new DefaultTableCellRenderer();
		celAlignCenter.setHorizontalAlignment(JLabel.CENTER); // 중간


		// 컬럼은 글의 중간 맞춤이 된다
		jtable.getColumn("주문자").setCellRenderer(celAlignCenter);
		jtable.getColumn("coffee").setCellRenderer(celAlignCenter);
		jtable.getColumn("크기").setCellRenderer(celAlignCenter);
		jtable.getColumn("시럽").setCellRenderer(celAlignCenter);
		jtable.getColumn("샷추가").setCellRenderer(celAlignCenter);
		jtable.getColumn("휘핑크림").setCellRenderer(celAlignCenter);
		jtable.getColumn("잔").setCellRenderer(celAlignCenter);
		jtable.getColumn("총액").setCellRenderer(celAlignCenter);
		
		jscrPane = new JScrollPane(jtable);
		jscrPane.setBounds(10, 50, 600, 185);
		add(jscrPane);
		

		setBounds(700, 350, 650, 350);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		
		
		
		// 윈도우 X 버튼으로 창을 닫을 때
		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				Singleton s = Singleton.getInstance();
				s.totalPrice = false;
				setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
			}
		});
		
		
		
		
		

	}
	
}
