package com.bitcamp.gachi.register;


public interface RegisterDaoImp {
	public int registerInsert(RegisterVO vo);
	public String selectList(RegisterVO vo);
	public RegisterVO memberLogin(RegisterVO vo);
}
