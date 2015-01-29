package rs.ac.bg.etf.pp1.sv110059;

import java_cup.runtime.Symbol;
//import org.apache.log4j.Logger;
import java.io.PrintStream;

%%

%{
	// ukljucivanje informacije o poziciji tokena
	private Symbol new_symbol(int type) {
		return new Symbol(type, yyline+1, yycolumn);
	}
	// ukljucivanje informacije o poziciji tokena
	private Symbol new_symbol(int type, Object value) {
		return new Symbol(type, yyline+1, yycolumn, value);
	}
	
	private int errorLine;
	private int errorColumn;
	private StringBuilder errorString;
	//private Logger logger = Logger.getLogger(MJTest.class);
	private PrintStream ps = System.err;
	
	public PrintStream getPrintStream() {
		return ps;
	}
	public void setPrintStream(PrintStream ps) {
		this.ps = ps;
	}
%}

%cup
%line
%column

%xstate COMMENT, ERROR

%eofval{
	return new_symbol(sym.EOF);
%eofval}

%%

" " {}
"\b" {}
"\t" {}
"\r\n" {}
"\f" {}

<YYINITIAL> "program" { return new_symbol(sym.PROGRAM, yytext()); }
"break" { return new_symbol(sym.BREAK, yytext()); }
"class" { return new_symbol(sym.CLASS, yytext()); }
"else" { return new_symbol(sym.ELSE, yytext()); }
"const" { return new_symbol(sym.CONST, yytext()); }
"if" { return new_symbol(sym.IF, yytext()); }
"new" { return new_symbol(sym.NEW, yytext()); }
"print" {return new_symbol(sym.PRINT, yytext());}
"read" { return new_symbol(sym.READ, yytext()); }
"return" {return new_symbol(sym.RETURN, yytext());}
"void" {return new_symbol(sym.VOID, yytext());}
"while" { return new_symbol(sym.WHILE, yytext()); }
"extends" { return new_symbol(sym.EXTENDS, yytext()); }
"+" {return new_symbol(sym.PLUS, yytext());}
"-" {return new_symbol(sym.MINUS, yytext());}
"*" {return new_symbol(sym.TIMES, yytext());} 
"/" {return new_symbol(sym.DIV, yytext());}
"%" { return new_symbol(sym.MOD, yytext()); }
"==" { return new_symbol(sym.IS_EQUAL, yytext()); }
"!=" { return new_symbol(sym.NOT_EQUAL, yytext()); }
">" { return new_symbol(sym.GT, yytext()); }
">=" { return new_symbol(sym.GTE, yytext()); }
"<" { return new_symbol(sym.LT, yytext()); }
"<=" { return new_symbol(sym.LTE, yytext()); }
"&&" { return new_symbol(sym.AND, yytext()); }
"||" { return new_symbol(sym.OR, yytext()); }
"=" {return new_symbol(sym.EQUAL, yytext());}
"++" { return new_symbol(sym.INC, yytext()); }
"--" { return new_symbol(sym.DEC, yytext()); }
";" {return new_symbol(sym.SEMI, yytext());}
"," {return new_symbol(sym.COMMA, yytext());}
"." { return new_symbol(sym.DOT, yytext()); }
"(" {return new_symbol(sym.LPAREN, yytext());}
")" {return new_symbol(sym.RPAREN, yytext());}
"{" {return new_symbol(sym.LBRACE, yytext());}
"}" {return new_symbol(sym.RBRACE, yytext());}
"[" {return new_symbol(sym.LSQUARE, yytext());}
"]" {return new_symbol(sym.RSQUARE, yytext());}

"//" { yybegin(COMMENT); }
<COMMENT> . { yybegin(COMMENT); }
<COMMENT> "\r\n" { yybegin(YYINITIAL); }

[0-9]+ { return new_symbol(sym.NUMBER, new Integer(yytext())); }
"true" { return new_symbol(sym.BOOLCONST, new Boolean(yytext())); }
"false" { return new_symbol(sym.BOOLCONST, new Boolean(yytext())); }
"\""(\\.|[^\"])*"\"" { return new_symbol(sym.STRCONST, new String(yytext())); }
([a-z]|[A-Z])[a-z|A-Z|0-9|_]* {return new_symbol (sym.IDENT, yytext());}
"'"[\040-\176]"'" {return new_symbol (sym.CHARCONST, new Character(yytext().charAt(1)));}

. { errorLine = yyline+1; errorColumn = yycolumn+1; errorString = new StringBuilder(); errorString.append(yytext()); yybegin(ERROR); }
<ERROR> {
" " { ps.println("Leksicka greska ("+errorString.toString()+") u liniji "+errorLine+" i koloni " + errorColumn); yybegin(YYINITIAL);}
"\b" {ps.println("Leksicka greska ("+errorString.toString()+") u liniji "+errorLine+" i koloni " + errorColumn); yybegin(YYINITIAL);}
"\t" {ps.println("Leksicka greska ("+errorString.toString()+") u liniji "+errorLine+" i koloni " + errorColumn); yybegin(YYINITIAL);}
"\r\n" {ps.println("Leksicka greska ("+errorString.toString()+") u liniji "+errorLine+" i koloni " + errorColumn); yybegin(YYINITIAL);}
"\f" {ps.println("Leksicka greska ("+errorString.toString()+") u liniji "+errorLine+" i koloni " + errorColumn); yybegin(YYINITIAL);}
. { errorString.append(yytext()); }
}



