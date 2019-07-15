package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import dto.StudentDto;
import single.Singleton;

public class StudentDao {
	Scanner scan = new Scanner(System.in);
	StudentDto students[];
	private int count;
	private int studentNum;
	List<StudentDto> list = new ArrayList<StudentDto>();
	
	
	public StudentDao() {
		students = new StudentDto[10];
		studentNum = 1000;
	}
	
	
	// 학생 추가
	public void insert() {
		System.out.print("학생 이름 : ");
		String name = scan.next();
		System.out.print("학생 국어점수 : ");
		int lang = scan.nextInt();
		System.out.print("학생 영어점수 : ");
		int eng = scan.nextInt();
		System.out.print("학생 수학점수 : ");
		int math = scan.nextInt();
		
		StudentDto students = new StudentDto(studentNum, name, lang, eng, math);
		
		Singleton sc = Singleton.getInstance();
		sc.list.add(students);
		
		studentNum++;
		System.out.println("list.size() " + list.size());
		System.out.println("studentNum " + studentNum);
	} // insert 함수
	
	
	// 학생 삭제
	public void delete() {
		System.out.print("삭제할 학생 이름 : ");
		String name = scan.next();
		
		int index = search(name);
		if(index == -1) {
			System.out.println("학생을 찾을 수 없습니다");
			return;
		}
		
		for(int i = 0; i < list.size(); i++) {
			if(index == i) {
				Singleton sc = Singleton.getInstance();
				list.remove(index);
			}
		}
	} // delete 함수
	
	
	// 학생 검색
	public void select() {
		System.out.print("검색할 학생 이름 : ");
		String name = scan.next();
		
		int index = search(name);
		if(index == -1) {
			System.out.println("학생을 찾을 수 없습니다");
			return;
		}
		
		Singleton sc = Singleton.getInstance();
		System.out.println(sc.list.get(index));

	} // select 함수
	
	
	// 학생 성적 수정
	public void update() {
		System.out.print("수정할 학생 이름 : ");
		String name = scan.next();
		
		int index = search(name);
		if(index == -1) {
			System.out.println("학생을 찾을 수 없습니다");
			return;
		}
		
		System.out.print("국어 점수 : ");
		int lang = scan.nextInt();
		System.out.print("영어 점수 : ");
		int eng = scan.nextInt();
		System.out.print("수학 점수 : ");
		int math = scan.nextInt();

		Singleton sc = Singleton.getInstance();
		sc.list.set(index, new StudentDto(list.get(index).getNumber(),
				name, lang, eng, math));
	} // update 함수
	
	
	// 학생 찾기
	public int search(String name) {
		int findIndex = -1;
		StudentDto sDto = null;
		Singleton sc = Singleton.getInstance();
		
		for(int i = 0; i < sc.list.size(); i++) {
			sDto = sc.list.get(i);
			if(sDto.getName().equals(name)) {
				findIndex = i;
				return findIndex;
			}
		}

		return findIndex;
	} // search 함수
	
	
	// 학생 모두 출력
	public void allPrint() {
		Singleton sc = Singleton.getInstance();
		System.out.println(sc.list.toString());
	} // allPrint 함수
	
}
