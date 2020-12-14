package com.bitcamp.gachi.admin;

import java.util.Comparator;

public class ClassUnitSort implements Comparator<ClassVO> {

	@Override
	public int compare(ClassVO c1, ClassVO c2) {
		int unit1=c1.getUnit();
		int unit2=c2.getUnit();
		if(unit1 > unit2){
            return 1;
        }else if(unit1 < unit2){
            return -1;
        }else{
            return 0;
        }
	}

}
