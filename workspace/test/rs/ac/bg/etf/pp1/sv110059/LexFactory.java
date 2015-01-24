package rs.ac.bg.etf.pp1.sv110059;

import java_cup.runtime.*;

public class LexFactory {
	public static Scanner GetLex(String filename) {
		try {
			java.io.File fajl = new java.io.File(filename);
			java.io.FileReader r = new java.io.FileReader(fajl);
			return new Yylex(r);
		} catch (Exception ex) {
			return null;
		}
	}

}
