package elTag;

import java.text.DecimalFormat;

public class JSTLTagFilter {
	
	public static String commaFormat(int num) {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(num);
	}

}
