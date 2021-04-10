package trip;

import java.util.*;
public class CodeToCountry {
   public String codeToCountry(String code) {
	   Locale locale = new Locale("ENGLISH", code);
	   String text=locale.getDisplayCountry();
	   return text;
   }
}