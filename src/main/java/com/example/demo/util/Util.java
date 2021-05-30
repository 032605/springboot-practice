package com.example.demo.util;

import java.math.BigInteger;

public class Util {

	public static int getAsInt(Object object) {
		if (object instanceof BigInteger ) {
			return ((BigInteger)object).intValue();
		}
		
		if (object instanceof Long ) {
			return (int)((long)object);
		}
		
		if (object instanceof Integer ) {
			return (int)object;
		}
		
		return -1;
	}

}