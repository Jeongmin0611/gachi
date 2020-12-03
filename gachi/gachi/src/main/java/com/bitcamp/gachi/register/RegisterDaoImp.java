package com.bitcamp.gachi.register;


public interface RegisterDaoImp {
	public int registerInsert(RegisterVO vo);
	public int creatorInsert(RegisterVO vo);
	public int creatorInsert2(RegisterVO vo);
	public String selectList(RegisterVO vo);
	public RegisterVO memberLogin(RegisterVO vo);
	public RegisterVO useridChk(RegisterVO vo);
}
