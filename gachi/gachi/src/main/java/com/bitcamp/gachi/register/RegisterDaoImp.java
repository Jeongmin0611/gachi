package com.bitcamp.gachi.register;


public interface RegisterDaoImp {
	public int registerInsert(RegisterVO vo);

	public RegisterVO memberLogin(RegisterVO vo);
}
