package com.rhymes.app.used.Service;

import java.util.List;
import java.util.Map;

import com.rhymes.app.used.model.MyUsedParam;
import com.rhymes.app.used.model.NotesDto;
import com.rhymes.app.used.model.NotesRecvParam;
import com.rhymes.app.used.model.NotesSendParam;
import com.rhymes.app.used.model.ProductsDto;

public interface MyUsedService {

	List<String> getMemberid(Map<String, Object> map);

	boolean getsubscribe(Map<String, Object> map);

	boolean deletesubscribe(Map<String, Object> map);

	boolean addsubscribe(Map<String, Object> map);

	int idcheck(String id);

	boolean sendnotes(NotesDto ndto);

	List<NotesDto> getsendnotes(NotesSendParam sparam);

	List<NotesDto> getrecvnotes(NotesRecvParam rparam);

	NotesDto getnotesdetail(Map<String, Object> map);

	boolean notesdelete(NotesDto ndto);

	boolean notesdelete2(NotesDto ndto);

	public int getRecvNotesCount(NotesRecvParam param);

	public int getSendNotesCount(NotesSendParam sparam);

	List<ProductsDto> getMyUsedList(MyUsedParam mparam);

	boolean updatedivision(ProductsDto pDto);

	int MyusedCount(MyUsedParam mparam);
}
