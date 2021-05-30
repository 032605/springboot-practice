package com.example.demo.util;

import java.math.BigInteger;

public class Util {

	public static int getAsInt(Object object) {
		return getAsInt(object, -1);
	}

	public static int getAsInt(Object object, int defaultValue) {
		if (object instanceof BigInteger ) {
			return ((BigInteger)object).intValue();
		}
		if (object instanceof String ) {
			return Integer.parseInt((String) object);
		}
		if (object instanceof Long ) {
			return (int)((long)object);
		}
		
		if (object instanceof Integer ) {
			return (int)object;
		}
		
		return defaultValue;
	}

}
