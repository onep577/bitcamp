package file1;

import java.io.File;
import java.io.IOException;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	file : 저장매체 == 기능 -> 가져다 사용
		 	Database : oracle -> 파일
		 	
		 	DB는 서버라서 보안에 취약 file은 다 보고 가져다 사용한다 머리로 풀 생각 하지말자
		 	
		 	*. // 모든것을 포함한다		DLL은 고급 동적 파일이다	라이브러리는 정적 파일이다
		 	*.txt -> 2진수 ->		dll(Dynamic Link Lib), lib(Library), jar
		*/
		
		// File.io 에서 io는 input, output이다
		// File 클래스의 file 변수에 E 드라이브를 가져온다
		File file = new File("E:\\"); // E 드라이브 안이다
		
		
		
		/*
		// 경로의 파일명을 조사
		String filelist[] = file.list(); // String[] 로 리턴
		// 여기서 file은 E 드라이브 안이다
		// file.listFiles();면 에러난다 string[]을 file[]에 넣었기 때문이다
		// 에러코드 Type mismatch: cannot convert from File[] to String[]
		// 파일명만 문자열의 배열로 가져온다
		
		for (int i = 0; i < filelist.length; i++) {
			System.out.println(filelist[i]);
		} // 앞에 $ 붙은것은 감춰진 파일이란 뜻이다
		/**/
		/*
		 	$RECYCLE.BIN
			eclipse
			eclipse-jee-2019-03-R-win32-x86_64.zip
			java
			java1
			System Volume Information
			tmp
		*/
		
		
		
		// 위에는 String에 대한 배열 아래는 File에 대한 배열이다
		// 위에는 경로에 대한 파일명만 조사 아래는 경로에 대한 파일,폴더 등을 조사
		// 파일과 폴더를 조사
		File filelist[] = file.listFiles(); // File로 리턴
		// 여기서 file은 E 드라이브 안이다
		// file.list(); 면 에러난다 file 배열에 String 배열을 넣었기 때문이다
		// 에러코드 Type mismatch: cannot convert from String[] to File[]
		
		for (int i = 0; i < filelist.length; i++) {
			if(filelist[i].isFile()) { // 파일일때
				System.out.println("[파일]" + filelist[i].getName());
			}
			// 디렉토리가 폴더이다
			else if(filelist[i].isDirectory()) { // 폴더일때
				System.out.println("[폴더]" + filelist[i].getName());
			}
			else { // 파일과 폴더 둘 다 아닐때
				System.out.println("[?]" + filelist[i].getName());
			}
		}
		/**/
		/*
		 	[폴더]$RECYCLE.BIN
			[폴더]eclipse
			[파일]eclipse-jee-2019-03-R-win32-x86_64.zip
			[폴더]java
			[폴더]java1
			[폴더]System Volume Information
			[폴더]tmp
		*/
		
		
		
		// 파일 생성
		File newFile = new File("E:\\tmp\\newfille.txt"); // 실제로 만드는 것은 아니다
		
		// newFile.createNewFile(); // IOException
		
		// 실제로 파일을 만드는 것이다
		try {
			if(newFile.createNewFile()) { // 리턴값이 boolean 이다
				System.out.println("newFile.txt 파일 생성 성공!");
			}
			else { // 파일 생성 후 같은 이름으로 다시 생성하면 여기로 온다
				System.out.println("newFile.txt 파일 생성 실패!");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		// 폴더 생성
		String dirStr = "E:\\tmp1\\sub"; // 폴더 두개 만든다
		File newDir = new File(dirStr);
		
		// 메이크 디렉토리s
		if(newDir.mkdirs()) { // mkdir 폴더 하나 만들때, mkdirs 폴더 두개 이상 만들 때
			System.out.println("폴더 생성 성공");
		}else {
			// 같은 이름의 폴더를 만들면 여기로 온다
			System.out.println("폴더 생성 실패");
		}
		
		
		
		// file 존재 여부
		if(newFile.exists()) {
			System.out.println("파일이 존재합니다");
		}else {
			System.out.println("파일이 존재하지 않습니다");
		}
		
		
		
		// file 쓰기/읽기 가능여부
		if(newFile.canWrite()) {
			System.out.println("파일쓰기가 가능합니다");
		}else {
			System.out.println("파일쓰기가 불가능합니다");
		}
		
		
		
		// file 삭제
		if(newFile.delete()) {
			System.out.println("파일을 삭제하였습니다");
		}else {
			// 파일이 없어서 삭제 못 했을 때 여기로 온다
			System.out.println("파일을 삭제하지 못했습니다");
		}
		
		
		
	} // main 함수

}
