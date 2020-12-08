package com.bitcamp.gachi.admin;

import java.util.Comparator;

public class ClassvideoSort implements Comparator<ClassVideoVO>{

	@Override
	public int compare(ClassVideoVO o1, ClassVideoVO o2) {
		int unit1 = ((ClassVideoVO)o1).getUnit();
        int unit2 = ((ClassVideoVO)o2).getUnit();
        
        if(unit1 > unit2){
            return 1;
        }else if(unit1 < unit2){
            return -1;
        }else{
            return 0;
        }
	}
}
