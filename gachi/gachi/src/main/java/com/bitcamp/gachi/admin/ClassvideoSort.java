package com.bitcamp.gachi.admin;

import java.util.Comparator;

public class ClassvideoSort implements Comparator<ClassVideoVO>{

	@Override
	public int compare(ClassVideoVO o1, ClassVideoVO o2) {
		String unit1=String.valueOf(((ClassVideoVO)o1).getUnit());
		String index1=String.valueOf(((ClassVideoVO)o1).getSection_index());
		String unit2=String.valueOf(((ClassVideoVO)o2).getUnit());
		String index2=String.valueOf(((ClassVideoVO)o2).getSection_index());
	
		int res1=Integer.parseInt(unit1+index1);
		int res2=Integer.parseInt(unit2+index2);
		
		System.out.println("res1==> "+res1);
		System.out.println("res2==> "+res2);
        if(res1 > res2){
            return 1;
        }else if(res1 < res2){
            return -1;
        }else{
            return 0;
        }
	}
}
