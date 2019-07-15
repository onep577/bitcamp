package fileWrite;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class mainClass {

	public static void main(String[] args) {
		File file = new File("E:/tmp/newFile.txt");
		
		// 기존 파일 위에 덧입힌다 // 생성과 같이 기입 // 조심하자!!
		
		// readonly 설정
		// file.setReadOnly(); // 이 다음부터 Write는 안되고 Read만 된다
		
		// readonly 해제
		// file.setWritable(true); // 이 다음부터 Read는 안되고 Write만 된다
		
		// 쓰기
		try {
			/*
			FileWriter fileWriter = new FileWriter(file);
			fileWriter.write("안녕하세요");
		
			fileWriter.write("hi good day");
			fileWriter.close();		// write()의 경우는 작성의 마무리를 꼭 해준다
			/**/
			
			/*
			PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(file)));
			
			pw.print("안녕");
			pw.println("안녕하세요");
			pw.print("hello");
			pw.close();
			/**/
			
			// 추가 쓰기
			
			FileWriter fileWriter = new FileWriter(file, true); // 추가
			fileWriter.write("안녕하세요");
		
			fileWriter.write("hi good day");
			fileWriter.close();		// write()의 경우는 작성의 마무리를 꼭 해준다
			/**/
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	} // main 함수

}
