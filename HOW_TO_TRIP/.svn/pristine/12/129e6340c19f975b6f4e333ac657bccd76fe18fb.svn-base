package encoding;

public class TextToHTML {
	/**
	 * text -> html
	 * 
	 * @param str
	 * @return
	 */
	public static String toTEXT(String str) {
		if (str == null)
			return null;

		String returnStr = str;
		returnStr = returnStr.replaceAll("&amp;", "&");
		returnStr = returnStr.replaceAll("&gt;", ">");
		returnStr = returnStr.replaceAll("&lt;", "<");
		returnStr = returnStr.replaceAll("&quot;", "\"");
		// returnStr = returnStr.replaceAll("&nbsp;", " ");
		returnStr = returnStr.replaceAll("&quot;", "\"");
		returnStr = returnStr.replaceAll("<br>", "\n");
		return returnStr;
	}

	/**
	 * html -> text
	 */
	public static String replaceHtml(String srcString) {
		if (srcString == null)
			return null;

		String rtnStr = srcString;
		try {
			rtnStr = rtnStr.replaceAll("&", "&amp;");
			rtnStr = rtnStr.replaceAll("<", "&lt;");
			rtnStr = rtnStr.replaceAll(">", "&gt;");
			rtnStr = rtnStr.replaceAll("\"", "&quot;");
			rtnStr = rtnStr.replaceAll("\'", "");
			rtnStr = rtnStr.replaceAll("<br>", "\n");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rtnStr;
	}
}
