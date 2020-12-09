package com.bitcamp.gachi.register;

import java.util.List;

public interface RegisterDaoImp {
	public int registerInsert(RegisterVO vo);
	public int mileageInsert(RegisterVO vo);
	public int creatorInsert(RegisterVO vo);
	public int creatorInsert2(RegisterVO vo);
	public String selectList(RegisterVO vo);
	public RegisterVO memberLogin(RegisterVO vo);
	public int useridChk(String okid);
	public int useridChk2(String okid2);
	public String useridF(String useridF);
	public String userpwdF(String userpwdF);
	public List<SearchPageVO> searchTextChk(RegisterVO vo);
	public List<SearchPageVO> searchTextChk2(RegisterVO vo);
	public List<SearchPageVO> searchTextChk3(RegisterVO vo);
	public int classMore(RegisterVO vo);
	public int storeMore(RegisterVO vo);
	public int creatorMore(RegisterVO vo);
	public void creatoemileageInsert(RegisterVO vo);

}
