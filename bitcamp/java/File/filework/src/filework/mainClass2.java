package filework;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

import javax.swing.text.StyledEditorKit.ForegroundAction;

public class mainClass2 {

	public static void main(String[] args) {
		/*
		 	menu
		 	1. 파일 생성	->	파일명 입력
		 	2. 파일 삭제	->	파일명 입력
		 	3. 파일 쓰기	->	파일명 입력 + 문자열
		 	4. 파일 읽기	->	파일명 입력 + 불러들인 문자열을 String[] 클래스에 담기
		 	5. 파일 추가 쓰기	
		 	6. 읽어온 데이터를 모두 출력
			7. 검색	-> 이름
			8. 종료
		*/
	
		//String fileStr = "E:\\tmp2\\newfile.txt";
		//File newFile = new File(fileStr);
		//String[] strFilePrint = {};
		//int w = 0;
		String u_fileName = null;
		//String u_Writer = null;
		
		
		Scanner scan = new Scanner(System.in);
		
		while(true) {
			System.out.println("menu");
			System.out.println("1. 파일 생성");
			System.out.println("2. 파일 삭제");
			System.out.println("3. 파일 쓰기");
			System.out.println("4. 파일 읽기");
			System.out.println("5. 파일 추가 쓰기	");
			System.out.println("6. 읽어온 데이터를 모두 출력");
			System.out.println("7. 검색");
			System.out.println("8. 프로그램 종료");
			System.out.println("==================================");
			System.out.print("입력하세요 : ");
			String menu = scan.next();
			
			switch(menu) {
				case "1":
					// 1. 입력한 파일명의 파일을 생성한다
					System.out.print("생성할 파일명을 입력해주세요 : ");
					u_fileName = scan.next();
					createNewFile(u_fileName); // 인자로 String 변수를 보낸다
					break;
				case "2":
					// 2. 입력한 파일명의 파일을 삭제한다
					System.out.print("삭제할 파일명을 입력해주세요 : ");
					u_fileName = scan.next();
					delete(u_fileName); // 인자로 File 변수를 보낸다
					break;
				case "3":
					// 3. 입력한 파일명의 파일안에 문자열을 쓴다
					System.out.print("쓰기 파일명을 입력해주세요 : ");
					u_fileName = scan.next();
					fileWriter(u_fileName);
					break;
				case "4":
					// 4. 입력한 파일명의 파일안에 불러들인 문자열을 String[] 에 담는다
					System.out.print("읽을 파일명을 입력해주세요 : ");
					u_fileName = scan.next();
					String[] filePrint = fileRead(u_fileName);
					for (int i = 0; i < filePrint.length; i++) {
						System.out.println("filePrint["+i+"] ="+filePrint[i]);
					}
					break;
				case "5":
					// 5.입력한 파일명의 파일에 문자열을 새로 추가 쓰기한다
					System.out.print("다시쓰기 파일명을 입력해주세요 : ");
					u_fileName = scan.next();
					fileWriterPlus(u_fileName);
					break;
				case "6":
					// 6.입력한 파일명의 파일을 가져오고 확인 후 문자열을 저장한 배열을 모두 출력한다
					System.out.print("모두 출력할 파일명을 입력해주세요 : ");
					u_fileName = scan.next();
					allPrint(u_fileName);
					break;
				case "7":
					// 7. 검색	-> 이름
					System.out.print("검색할 파일명을 입력해주세요 : ");
					u_fileName = scan.next();
					System.out.print("검색할 이름을 입력해주세요 : ");
					String u_name = scan.next();
					
					String human = searchData(u_fileName, u_name);
					System.out.println("human : " + human);
					String split[] = human.split("-");
					System.out.println("name : " + split[0]);
					System.out.println("age : " + split[1]);
					System.out.println("address : " + split[2]);
					break;
				case "8":
					break;
			}
			if(menu.equals("8")) break;
		}
		System.out.println("프로그램 끝");
		
		
		
	} // main 함수



	// 파일 생성
	static void createNewFile(String fileName) { // 인자로 String 변수를 받는다
		File newFile = new File("E:\\tmp2\\" + fileName + ".txt");
		// main 함수에서 fileStr을 보면 tmp2 폴더에 newfile 파일이 있다는 말이다
		// tmp2 폴더가 없으면 만들 수 없다 에러코드 java.io.IOException: 지정된 경로를 찾을 수 없습니다
		
		try {
			if(newFile.createNewFile()) { // 리턴값이 boolean 이다 true 명 파일 생성
				System.out.println(fileName + ".txt 파일 생성 성공!");
			}
			else { // 파일 생성 후 같은 이름으로 다시 생성하면 여기로 온다
				System.out.println(fileName + ".txt 파일 생성 실패!");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} // createNewFile 함수
	
	
	
	// 파일 삭제
	static void delete(String fileName) { // 인자로 File 변수를 받는다
		String fileStr = "E:\\tmp2\\" + fileName + ".txt";
		File newFile = new File(fileStr);
		
		if(newFile.delete()) {
			System.out.println(fileName + ".txt 파일 삭제");
		}else {
			// 파일이 없어서 삭제 못 했을 때 여기로 온다
			System.out.println(fileName + ".txt 파일 삭제 못했습니다");
		}
	} // delete 함수
	
	
	
	// 쓰기가 가능한 파일이면 true로 리턴
	static boolean checkBeforeWriteFile(String u_fileName) { // utility 함수
		File f = new File("E:\\tmp2\\" + u_fileName + ".txt");
		if(f.exists()) { // 파일이 있나요?
			if(f.isFile()) { // 파일인가요?
				if(f.canWrite()) { // 쓰기가 가능한가요?
					System.out.println("쓰기 체크 확인 안 : 파일쓰기가 가능합니다");
					return true;
				}else {
					System.out.println("쓰기 체크 확인 안 : 파일쓰기가 불가능합니다");
					return false;
				}
			}
		}
		return false;
	} // checkBeforeReadFile 함수

	
	
	static boolean fileWriter(String u_fileName){
		Scanner sc = new Scanner(System.in);
		File f = new File("E:\\tmp2\\" + u_fileName + ".txt");
		// 입력한 파일명의 파일에 쓰기가 가능한지 확인하는 함수
		boolean b = checkBeforeWriteFile(u_fileName); // 인자로 파일명을 보낸다
		// 쓰기가 가능하면 true 출력, 불가능하면 false 출력
		
		if(b == false) {
			System.out.println("파일 존재하지 않습니다");
			return false;
		}else {
			System.out.print("이름>>");
			String name = sc.next();
			
			System.out.print("나이>>");
			int age = sc.nextInt();
			
			System.out.print("주소>>");
			String address = sc.next();
			
			String data = name + "-" + age + "-" + address; // split
			
			PrintWriter pw;
			
		
			try {
				pw = new PrintWriter(new BufferedWriter(new FileWriter(f)));
				pw.println(data);
				pw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println(u_fileName + ".txt 파일에 " + data + "를 작성하였습니다");
			
			return true;
		}		
		
	} // fileWriter 함수
	
	

	// 읽기가 가능한 파일이면 true로 리턴
	static boolean checkBeforeReadFile(String u_fileName) { // utility 함수
		String fileStr = "E:\\tmp2\\" + u_fileName + ".txt";
		File f = new File(fileStr);
		
		if(f.exists()) { // 파일이 있나요?
			if(f.isFile()) { // 파일인가요?
				if(f.canRead()) { // 쓰기가 가능한가요?
					System.out.println("읽기 체크 함수 안 : 파일읽기가 가능합니다");
					return true;
				}else {
					System.out.println("읽기 체크 함수 안 : 파일읽기가 불가능합니다");
				}
			}
		}
		return false;
	} // checkBeforeReadFile 함수
	


	static String[] fileRead(String u_fileName) {
		// 입력한 파일명의 파일이 읽을 수 있는 파일인지 확인하는 함수
		// 입력한 파일명의 파일이 있는지? 파일이 맞는지? 확인 후 문자열을 배열에 저장한다
		boolean b1 = checkBeforeReadFile(u_fileName); // 인자로 파일을 보낸다
		// 읽기가 가능하면 true 출력, 불가능하면 false 출력

		File f = new File("E:\\tmp2\\" + u_fileName + ".txt");
		String datas[] = null;

		if (!f.exists()) {
			System.out.println("파일이 존재하지 않습니다");
			return null;
		} else {

			try {
				BufferedReader br = new BufferedReader(new FileReader(f));
				// 파일에 있는 걸 읽어다가 문자로 저장

				// 데이터 수를 조사
				int count = 0;
				String str;
				while ((str = br.readLine()) != null) { // 비어있지 않을 때까지 돌려라
					// 읽어들인 문자가 값이 있으면 true while문 돌리자 값이 없으면 false 그만!
					// System.out.println("str1 = " + str1);
					count++;
					// System.out.println("w1 = " + w1);
				}
				br.close();

				// String 배열 생성
				datas = new String[count];

				// 데이터들을 배열에 읽고 넣기
				int len = 0;
				br = new BufferedReader(new FileReader(f));
				String str2;
				while ((str = br.readLine()) != null) { // 비어있지 않을 때까지 돌려라
					// 읽어들인 문자가 값이 있으면 true while문 돌리자 값이 없으면 false 그만!
					datas[len] = str;
					len++;
				}

				br.close();

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			return datas;
		}
	} // fileRead 함수
	
	
	
	static boolean fileWriterPlus(String u_filename) {
		Scanner sc = new Scanner(System.in);		
		File u_File = new File("E:\\tmp2\\" + u_filename + ".txt");
		
		boolean b = u_File.exists();
		
		if(b == false) {
			System.out.println("파일 존재하지 않습니다");
			return false;
		}else {
			System.out.print("이름>>");
			String name = sc.next();
			
			System.out.print("나이>>");
			int age = sc.nextInt();
			
			System.out.print("주소>>");
			String address = sc.next();
			
			String data = name + "-" + age + "-" + address; // split
			
			PrintWriter pw;
			try {
				pw = new PrintWriter(new BufferedWriter(new FileWriter(u_File, true)));
				pw.println(data);
				pw.close();				
			} catch (IOException e) {				
				e.printStackTrace();
			}				
			System.out.println(u_filename + ".txt 파일에 " + data + "를 추가 작성하였습니다");
			
			return true;
		}
	} // fileWriterPlus 함수



	static void allPrint(String u_file) {
		try {
		fileRead(u_file);
		

		File f = new File("E:\\tmp2\\" + u_file + ".txt");

		BufferedReader br = new BufferedReader(new FileReader(f));
		String str1;

		while((str1 = br.readLine()) != null) {
			System.out.println("모두 출력 : " + str1);
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	} // allPrint 함수
	
	
	
	// 검색이름, filename -> 인수
	// <- String
	static String searchData(String filename, String name) {
		
		String datas[] = fileRead(filename);
//		for (int i = 0; i < datas.length; i++) {
//			System.out.println("datas[" + i + "] = " + datas[i]);
//		}
		
		// 검색
		int findIndex = -1;
		for (int i = 0; i < datas.length; i++) {
			String data[] = datas[i].split("-");
			if(name.equals(data[0])) {
				findIndex = i;
				break;
			}
		}
		if(findIndex == -1) {
			return "";
		}
		return datas[findIndex];
	} // searchData 함수
	
	

}
