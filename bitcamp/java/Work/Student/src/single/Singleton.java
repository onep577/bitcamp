package single;

import java.util.ArrayList;
import java.util.List;

import dto.StudentDto;
import file.FileClass;

public class Singleton {
	private static Singleton s = null;
	public List<StudentDto> list;
	
	private Singleton() {
		list = new ArrayList<StudentDto>();
	}
	
	public static Singleton getInstance() {
		if(s == null) {
			s = new Singleton();
		}
		return s;
	}
}
