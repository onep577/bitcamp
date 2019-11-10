package com.rhymes.app.used.ServiceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.used.Service.MyUsedService;
import com.rhymes.app.used.dao.MyUsedDao;
import com.rhymes.app.used.model.MyUsedParam;
import com.rhymes.app.used.model.NotesDto;
import com.rhymes.app.used.model.NotesRecvParam;
import com.rhymes.app.used.model.NotesSendParam;
import com.rhymes.app.used.model.ProductsDto;

@Service
public class MyUsedServiceImpl implements MyUsedService {
	@Autowired MyUsedDao myUsedDao;
	
	
	@Override
	public List<String> getMemberid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myUsedDao.getMemberid(map);
	}


	@Override
	public boolean getsubscribe(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myUsedDao.getsubscribe(map);
	}


	@Override
	public boolean deletesubscribe(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myUsedDao.deletesubscribe(map);
	}


	@Override
	public boolean addsubscribe(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myUsedDao.addsubscribe(map);
	}


	@Override
	public int idcheck(String id) {
		// TODO Auto-generated method stub
		return myUsedDao.idcheck(id);
	}


	@Override
	public boolean sendnotes(NotesDto ndto) {
		
		return myUsedDao.sendnotes(ndto);
	}

	@Override
	public List<NotesDto> getsendnotes(NotesSendParam param) {
		// TODO Auto-generated method stub
		return myUsedDao.getsendnotes(param);
	}


	@Override
	public List<NotesDto> getrecvnotes(NotesRecvParam param) {
		// TODO Auto-generated method stub
		return myUsedDao.getrecvnotes(param);
	}


	@Override
	public NotesDto getnotesdetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myUsedDao.getnotesdetail(map);
	}


	@Override
	public boolean notesdelete(NotesDto ndto) {
		// TODO Auto-generated method stub
		return myUsedDao.notesdelete(ndto);
	}
	
	
	@Override
	public boolean notesdelete2(NotesDto ndto) {
		// TODO Auto-generated method stub
		return myUsedDao.notesdelete2(ndto);
	}
	@Override
	public int getRecvNotesCount(NotesRecvParam param) {
		// TODO Auto-generated method stub
		return myUsedDao.getRecvNotesCount(param);
	}

	@Override
	public int getSendNotesCount(NotesSendParam sparam) {
		// TODO Auto-generated method stub
		return myUsedDao.getSendNotesCount(sparam);
	}


	@Override
	public List<ProductsDto> getMyUsedList(MyUsedParam mparam) {
		// TODO Auto-generated method stub
		return myUsedDao.getMyUsedList(mparam);
	}


	@Override
	public boolean updatedivision(ProductsDto pDto) {
		// TODO Auto-generated method stub
		return myUsedDao.updatedivision(pDto);
	}


	@Override
	public int MyusedCount(MyUsedParam mparam) {
		// TODO Auto-generated method stub
		return myUsedDao.MyusedCount(mparam);
	}
	
	
	
}
