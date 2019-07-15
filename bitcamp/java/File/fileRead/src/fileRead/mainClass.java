package fileRead;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class mainClass {

	public static void main(String[] args) {
		File file = new File("E:/tmp/newFile.txt");

		
		try {
			if(checkBeforeReadFile(file)) { // 파일을 읽을 수 있으면 true가 리턴
			/*
			FileReader fileReader = new FileReader(file);
			
			// 한글자씩 읽어 온다
				int ch = fileReader.read();
				while(ch != -1) {	// -1이란 파일의 끝
					System.out.println((char)ch);
					ch = fileReader.read(); // 그 다음 문자로 간다
				}
				*/
			
			// 문장으로 읽어 들인다		한글자 -> 저장 모은다
				BufferedReader br = new BufferedReader(new FileReader(file));
				// 파일에 있는 걸 읽어다가 문자로 저장
				
				String str;
				while((str = br.readLine()) != null) { // 비어있지 않을 때까지 돌려라
					// 읽어들인 문자가 값이 있으면 true while문 돌리자 값이 없으면 false 그만!
					System.out.println("str = " + str);
				}
				br.close(); // 잊지 말자
			}
			else {
				System.out.println("파일을 찾을 수 없습니다");
			}
		/*}catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();*/
		}catch (Exception e) {
			// 두개의 익셉션을 다 받아낸다
		}
		// try catch를 밖으로 쓰자 이유는? file Not found, IOException
		// 두번의 예외가 발생한다 그래서 catch를 밑에 붙이면 코드가 깔끔해진다
		
		
	} // main 함수
	
	
	
	// 파일을 읽을 수 있으면 true로 리턴
	static boolean checkBeforeReadFile(File f) { // utility 함수
		if(f.exists()) { // 파일이 있나요?
			if(f.isFile() && f.canRead()) { // 파일이니? 파일을 읽을 수 있니?
				return true;
			}
		}
		return false;
	} // checkBeforeReadFile 함수

} // main class
