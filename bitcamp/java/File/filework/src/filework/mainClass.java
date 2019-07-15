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
import java.util.Stack;

public class mainClass {

	public static void main(String[] args) {
		/*
			menu
			1. 파일 생성	-> 파일명 입력
			2. 파일 삭제	-> 파일명 입력
			3. 파일 쓰기	-> 파일명 입력 + 문자열
			4. 파일 읽기	-> 파일명 입력 + String[]
			5. 파일 추가 쓰기
			6. 모두 출력
			7. 검색	-> 이름
			8. 종료
		*/		
	//	createFile("test");
		
	//	deleteFile("test");
		
	//	writeFile("test");
		
	//	appendWriteFile("test");
	
	/*	
		String arr[] = readFile("test");
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);			
		}
	*/	
		
		String human = searchData("opop", "고길동");
		System.out.println("human:" + human);
		String split[] = human.split("-");
		System.out.println("name:" + split[0]);
		System.out.println("age:" + split[1]);
		System.out.println("address:" + split[2]);
				
		
	}
	
	static File createFile(String filename) {
		File dirFile = new File("E:\\tmp2");
		String fileList[] = dirFile.list();
		boolean b = false;
		
		for (int i = 0; i < fileList.length; i++) {
			if(fileList[i].equals(filename + ".txt") == true) {
				b = true;
				break;
			}
		}
		
		if(b) {
			System.out.println("같은 이름의 파일이 존재합니다. 파일 생성하지 못했습니다");
			return null;
		}
		
		File newFile = new File("E:\\tmp2\\" + filename + ".txt"); 
		
		try {
			if(newFile.createNewFile()) {
				System.out.println(filename + ".txt 파일을 생성하였습니다");
			}else {
				System.out.println("파일을 생성하지 못했습니다");
				return null;
			}
		} catch (IOException e) {			
			System.out.println("예외가 발생하였습니다");
		}
		return newFile;
	}
	
	static void deleteFile(String filename) {
		File file = new File("E:\\tmp2\\" + filename + ".txt");
		
		boolean b = file.exists();
		if(b == false) {
			System.out.println("삭제할 파일" + filename + ".txt가 존재하지 않습니다");
		}else {
			if(file.delete()) {
				System.out.println("파일" + filename + ".txt를 삭제하였습니다");
			}else {
				System.out.println("파일" + filename + ".txt를 삭제하지 못했습니다");
			}			
		}		
	}
	
	static boolean writeFile(String filename) {
		Scanner sc = new Scanner(System.in);		
		File file = new File("E:\\tmp2\\" + filename + ".txt");
		boolean b = file.exists();
		
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
				pw = new PrintWriter(new BufferedWriter(new FileWriter(file)));
				pw.println(data);
				pw.close();				
			} catch (IOException e) {				
				e.printStackTrace();
			}				
			System.out.println(filename + ".txt 파일에 " + data + "를 작성하였습니다");
			
			return true;
		}		
	}
	
	static boolean appendWriteFile(String filename) {
		Scanner sc = new Scanner(System.in);		
		File file = new File("E:\\tmp2\\" + filename + ".txt");
		boolean b = file.exists();
		
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
				pw = new PrintWriter(new BufferedWriter(new FileWriter(file, true)));
				pw.println(data);
				pw.close();				
			} catch (IOException e) {				
				e.printStackTrace();
			}				
			System.out.println(filename + ".txt 파일에 " + data + "를 추가 작성하였습니다");
			
			return true;
		}		
	}
	
	static String[] readFile(String filename) {
		File file = new File("E:\\tmp2\\" + filename + ".txt");
		String datas[] = null;
		
		if(!file.exists()) {
			System.out.println("파일이 존재하지 않습니다");
			return null;
		}else {
			
			try {
				BufferedReader br = new BufferedReader(new FileReader(file));
				
				// 데이터 수를 조사
				int count = 0;
				String str;
				while((str = br.readLine())!= null) {
					count++;
				}
				br.close();
				
				// String 배열 생성
				datas = new String[count];
				
				// 데이터들을 배열에 읽고 넣기
				int len = 0;
				br = new BufferedReader(new FileReader(file));
				while((str = br.readLine())!= null) {
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
	}
	
	// 검색이름, filename -> 인수
	// <- String
	static String searchData(String filename, String name) {
		
		String datas[] = readFile(filename);
		
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
	}
	
	
	

}
