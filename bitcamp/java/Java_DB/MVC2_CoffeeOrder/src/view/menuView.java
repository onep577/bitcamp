package view;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Enumeration;
import java.util.List;

import javax.swing.AbstractButton;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;

import model.PriceDto;
import single.Singleton;

public class menuView extends JFrame implements ActionListener {
	private JPanel panel1, panel2, panel3;
	
	private JButton menuBtn, orderBtn, showBtn;
	
	private JRadioButton sizeRadio[], syrupRadio[];
	private ButtonGroup group1, group2;
	
	private JComboBox<String> coffe_type;
	private JComboBox<Integer> coffe_number;
	
	private JLabel label1, label2, label3, label4;
	private JCheckBox shot_check;
	private JCheckBox whip_check;
	
	List<PriceDto> list;
	String title[] = { "SHORT", "TALL", "GRANDE" };
	
	public menuView() {
		super("메뉴");
		setLayout(null);
		
		
		//////////////////////////////// 1	
		menuBtn = new JButton("Coffee Menu");
		menuBtn.setBounds(500, 50, 150, 50);
		menuBtn.addActionListener(this);
		add(menuBtn);
		

		Singleton s = Singleton.getInstance();
		// 커피 이름 가져왔다
		this.list = s.priControl.getCoffType();
		String[] selects = new String[list.size()];
		for (int i = 0; i < selects.length; i++) {
			selects[i] = new String(list.get(i).getCoffee_type());
		}
		coffe_type = new JComboBox<String>(selects);
		coffe_type.setBounds(100, 50, 300, 50);
		add(coffe_type);
		
		
		
		
		
		
		
		//////////////////////////////// 2
		panel1 = new JPanel();
		panel1.setBounds(100, 150, 150, 250);
		add(panel1);
		panel2 = new JPanel();
		panel2.setBounds(300, 150, 150, 250);
		add(panel2);
		panel3 = new JPanel();
		panel3.setBounds(500, 150, 150, 250);
		add(panel3);
		
		panel1.setLayout(new GridLayout(4,1));
		panel2.setLayout(new GridLayout(4,1));
		panel3.setLayout(new GridLayout(4,1));		
		
		
		label1 = new JLabel("크기");
		panel1.add(label1);
		label2 = new JLabel("시럽");
		panel2.add(label2);
		label3 = new JLabel("기타");
		panel3.add(label3);
		
		sizeRadio = new JRadioButton[3];
		syrupRadio = new JRadioButton[3];
		
		// 크기
		group1 = new ButtonGroup();
		for (int i = 0; i < sizeRadio.length; i++) { // 3
			sizeRadio[i] = new JRadioButton(title[i]);
			sizeRadio[i].setSelected(true);
			//sizeRadio[i].addActionListener(this);
			sizeRadio[i].addActionListener(this);
			sizeRadio[i].setBounds(0, 0, 100, 30);
			panel1.add(sizeRadio[i]);
			
			group1.add(sizeRadio[i]); // ButtonGroup에 추가한다. 프로세스로 판단하는 용도이다
		}
		
		// 시럽
		group2 = new ButtonGroup();
		String title2[] = { "바닐라", "카라멜", "헤이즐넛" };
		for (int i = 0; i < syrupRadio.length; i++) { // 3
			syrupRadio[i] = new JRadioButton(title2[i]);
			syrupRadio[i].setSelected(true);
			//tyrupRadio[i].addActionListener(this);
			syrupRadio[i].addActionListener(this);
			syrupRadio[i].setBounds(0, 0, 100, 30);
			panel2.add(syrupRadio[i]);
			
			group2.add(syrupRadio[i]); // ButtonGroup에 추가한다. 프로세스로 판단하는 용도이다
		}
		
		// 기타
		shot_check = new JCheckBox("샷추가");
		shot_check.setSelected(false);	// 체크가 안되어 있도록
		whip_check = new JCheckBox("휘핑크림");
		whip_check.setSelected(false);	// 체크가 안되어 있도록
		panel3.add(label3);
		panel3.add(shot_check);
		panel3.add(whip_check);
		
		
		
		
		
		
		//////////////////////////////// 3
		Integer[] selects2 = new Integer[]
				{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
		coffe_number = new JComboBox<Integer>(selects2);
		coffe_number.setBounds(300, 450, 100, 50);
		add(coffe_number);
		
		label4 = new JLabel("잔");
		label4.setBounds(410, 460, 50, 40);
		label4.setBackground(Color.black);
		add(label4);
		
		orderBtn = new JButton("Order Button");
		orderBtn.setBounds(500, 450, 150, 50);
		orderBtn.addActionListener(this);
		add(orderBtn);
		
		showBtn = new JButton("Total Button");
		showBtn.setBounds(100, 450, 150, 50);
		showBtn.addActionListener(this);
		add(showBtn);
		
		
		
		
		setBounds(0, 0, 700, 600);
		setVisible(true);

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		Singleton s = Singleton.getInstance();
		Object obj = e.getSource();

		
		if(obj == menuBtn) {
			if(s.coffeePrice) {
				JOptionPane.showMessageDialog(null, "이미 창이 있습니다");
			}else {
				s.priControl.PriceView();
				s.coffeePrice = true;
			}
			
		}else if(obj == orderBtn) {
			String id = s.cusControl.LoginId();
			String coffName = coffe_type.getSelectedItem()+"";
			String coffSize = "";
			String coffSyrup = "";
			String isShot = "추가안함";
			String isWhip = "추가안함";
			int coffNum = Integer.parseInt(coffe_number.getSelectedItem()+"");
			int totalPrice = 0;
			
			// 커피 크기
			Enumeration<AbstractButton> enums = group1.getElements();
			while(enums.hasMoreElements()) {
				// 버튼 즉, 데이터가 있는 만큼 while문이 돈다
				AbstractButton ab = enums.nextElement();
				JRadioButton rb = (JRadioButton)ab;
				if(rb.isSelected()) {
					//JOptionPane.showMessageDialog(null, rb.getText());
					coffSize = rb.getText();
				}
			}
			
			// 커피 시럽
			enums = group2.getElements();
			while(enums.hasMoreElements()) {
				// 버튼 즉, 데이터가 있는 만큼 while문이 돈다
				AbstractButton ab1 = enums.nextElement();
				JRadioButton rb2 = (JRadioButton)ab1;
				if(rb2.isSelected()) {
					//JOptionPane.showMessageDialog(null, rb2.getText());
					coffSyrup = rb2.getText();
				}
			}
			
			// 샷 추가 여부
			if(shot_check.isSelected()) {
				isShot = "추가";
			}
			
			// 휘핑크림 추가 여부
			if(whip_check.isSelected()) {
				isWhip = "추가";
			}
			
			// 결과
			JOptionPane.showMessageDialog(null,
					id+" : "+coffName+" : "+coffSize+" : "+coffSyrup+" : "+
					isShot+" : "+isWhip+" : "+coffNum);
			
			// 총액
			int onePrice = s.priControl.getTypeOnePrice
					(coffSize, coffName);
			totalPrice = onePrice * coffNum;
			
			// DB에 추가
			s.orderControl.setOrder(id, coffName, coffSize,
					coffSyrup, isShot, isWhip, coffNum, totalPrice);
			
		}else if(obj == showBtn) {
			if(s.totalPrice) {
				JOptionPane.showMessageDialog(null, "이미 창이 있습니다");
			}else {
				s.orderControl.TotalView();
				s.totalPrice = true;
			}			
		}
		
		
		
		
		
		
		
	} // actionPerformed 함수

}


