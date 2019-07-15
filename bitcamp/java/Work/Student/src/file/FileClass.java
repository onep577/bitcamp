package file;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import dto.StudentDto;
import single.Singleton;

public class FileClass {
	private File myfile;
	private String filename;
	
	public FileClass() {
		myfile = new File("E:\\baseballmember\\baseballmember.txt");
		filename = "baseballmember.txt";
		createFile();
	}
	
	public File createFile() {
		try {
			if(myfile.createNewFile()) {
				System.out.println(filename + "파일 생성 성공");
			}else {
				System.out.println(filename + "파일 생성 실패");
			}			
		} catch (IOException e) {			
			e.printStackTrace();
		}
		return myfile;
	} // createFile 함수
	
	public void dataSave() { // list에서 file로 저장
		Singleton sc = Singleton.getInstance();
		String datas[] = new String[sc.list.size()];
		
		for (int i = 0; i < sc.list.size(); i++) {
			StudentDto dto = sc.list.get(i);
			datas[i] = dto.toString();
		}
		
		try {
			PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(myfile)));
			
			for (int i = 0; i < datas.length; i++) {
				pw.println(datas[i]);
			}
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(filename + "파일에 데이터를 저장하였습니다");
		
	} // dataSave 함수
	
	public void dataLoad() { // file에서 다시 list로 저장
		Singleton sc = Singleton.getInstance();
		String str = null;

		try {
		BufferedReader br = new BufferedReader(new FileReader(myfile));
		
		while((str = br.readLine())!= null) {
			String data[] = str.split("-");
			StudentDto dto = new StudentDto(Integer.parseInt(data[0]), 
											data[1], 
											Integer.parseInt(data[2]), 
											Integer.parseInt(data[3]), 
											Integer.parseInt(data[4]));
			sc.list.add(dto);
		}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} // dataLoad 함수

}
