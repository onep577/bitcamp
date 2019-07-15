package dao;

import java.util.Scanner;

import dto.StudentDto;

// Data Access Object
public class DaoClass {
	// Dao = Back end
	
	Scanner scan = new Scanner(System.in);
	
	StudentDto students[];
	private int count;
	private int studentNum;
	
	public DaoClass() {
		students = new StudentDto[10]; // 변수만 선언했다
		count = 0;
		studentNum = 100;
	}
	
	
	
	// insert
	public void insert() {
		// 학생정보 추가
		// 입력 (Scanner)
		//StudentDto dto = new StudentDto(studentNum, "홍길동", 90, 100, 85);
		StudentDto dto = new StudentDto();
		students[count] = dto; // 생성자를 활용해 입력받은 데이터를 dto로 넣어주었다
		count++;
		studentNum++;
		
		System.out.println("=====================");
		System.out.println("추가 학생번호 : " + studentNum);
		dto.setNumber(studentNum);
		
		System.out.print("추가 학생이름 : ");
		dto.setName(scan.next());
		
		System.out.print(dto.getName() + " 국어점수 : ");
		dto.setLang(scan.nextInt());
		
		System.out.print(dto.getName() + " 영어점수 : ");
		dto.setEng(scan.nextInt());
		
		System.out.print(dto.getName() + " 수학점수 : ");
		dto.setMath(scan.nextInt());
		System.out.println(dto.getName() + "학생의 정보를 추가했습니다");
		
		
	} // insert 함수
	
	
	
	// delete
	public void delete() {
		// 학생정보 삭제
		// 이름을 입력하면 그 학생의 정보가 다 삭제
		
		System.out.println("=====================");
		System.out.print("정보를 삭제할 학생 이름 : ");
		String name = scan.next();
		
		int index = search(name);
		// 이름을 넘겨주고 찾은 인덱스 넘버를 리턴 받았다
		if(index == -1) {
			System.out.println("학생 이름을 찾을 수 없습니다");
		}
		else {
			StudentDto dto = students[index];
			dto.setNumber(0);
			dto.setName("");
			dto.setLang(0);
			dto.setEng(0);
			dto.setMath(0);
			System.out.println("학생 데이터를 삭제하였습니다");
		}		
	} // delete 함수
	
	
	
	// select == search
	public void select() {
		// 학생정보 검색
		// 이름을 입력하면 그 학생의 정보가 다 출력
		
		System.out.println("=====================");
		System.out.print("정보를 검색할 학생 이름 : ");
		String name = scan.next();
		
		int index = search(name);
		// 이름을 넘겨주고 찾은 인덱스 넘버를 리턴 받았다
		if(index == -1) {
			System.out.println("학생 이름을 찾을 수 없습니다");
		}
		else {
			System.out.println("검색된 학생정보 : ");
			StudentDto dto = students[index];
			System.out.println(dto.toString());
		}
	} // select 함수
	
	
	
	// update
	public void update() {
		// 학생정보 수정
		// 이름을 입력하고 학생 정보 다 수정
		
		System.out.println("=====================");
		System.out.print("정보를 수정할 학생 이름 : ");
		String name = scan.next();
		
		int index = search(name);
		
		if(index == -1) {
			System.out.println("학생 이름을 찾을 수 없습니다");
			return; // 학생이름이 없을 때 update 함수가 여기가 끝난다
		}else {
			// 학생 이름을 찾았을 때
			System.out.println("수정 데이터를 입력해주세요");
			System.out.print("국어 : ");
			int lang = scan.nextInt();
			System.out.print("영어 : ");
			int eng = scan.nextInt();
			System.out.print("수학 : ");
			int math = scan.nextInt();
			
			StudentDto dto = students[index];
			dto.setLang(lang);
			dto.setEng(eng);
			dto.setMath(math);
			
			System.out.println("수정을 완료했습니다");
		}

	} // update 함수
	
	
	
	public int search(String name) {
		// 입력한 이름을 받아서 찾은 인덱스번호를 리턴한다
		// select, update, search 의 공통부분 찾기만 하는 함수
		int findIndex = -1;
		// 인덱스는 0부터 시작하니까 초기값은 -1로 하자 리턴이 -1이다 즉, 못 찾았다
		for (int i = 0; i < students.length; i++) {
			StudentDto dto = students[i];
			
			if(dto != null && dto.getNumber() != 0) {
				// 항상 dto != null 이것부터 비교하자 왜?
				// dto.getNumber() != null 이것 때문에 Null포인터익셉션이 뜬다
				
				if(name.equals(dto.getName())) {
					// 같은 이름을 찾았다
					findIndex = i;
					break;
				}
			}
		}
		return findIndex;
		// 찾을때는 찾기만 하는것이 좋다
		// 하지만 미성년자를 찾아 데이터를 지우라! 하는 경우는 찾으면서 지워야하는 강사님 예시
	} // search 함수
	
	
	
	// allprint
	public void allPrint() {
		// 멤버 메서드이기 때문에 StudentDto 클래스의 배열이 얼마든지 접근 가능하다
		// 모든 학생정보 출력
		// 이름을 입력하면 모든 학생 정보 출력
		
		System.out.println("===========================================================");
		
		for (int i = 0; i < students.length; i++) {
			// 0 ~ 9까지 돌린다
			StudentDto dto = students[i];
			//System.out.println("students[" + i + "] = " + students[i]);
			if(dto != null && dto.getNumber() != 0) {
				System.out.println(dto.toString());
			}
		} // for

		System.out.println("===========================================================");
	} // allPrint 함수
	
	
	

} // DaoClass 클래스
