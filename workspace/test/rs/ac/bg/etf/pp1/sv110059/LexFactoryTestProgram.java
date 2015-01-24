package rs.ac.bg.etf.pp1.sv110059;

import static org.junit.Assert.*;
import java_cup.runtime.Scanner;

import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class LexFactoryTestProgram {
	private Scanner lex;

	@Before
	public void SetUp() {
		lex = LexFactory.GetLex("test\\Program.mj");
	}

	@Test
	public void test() throws java.lang.Exception {
		Assert.assertEquals(lex.next_token().sym, sym.PROGRAM);
		Assert.assertEquals(lex.next_token().sym, sym.IDENT);
		Assert.assertEquals(lex.next_token().sym, sym.IDENT);
		Assert.assertEquals(lex.next_token().sym, sym.IDENT);
		Assert.assertEquals(lex.next_token().sym, sym.COMMA);
		Assert.assertEquals(lex.next_token().sym, sym.IDENT);
		Assert.assertEquals(lex.next_token().sym, sym.SEMI);
		Assert.assertEquals(lex.next_token().sym, sym.LBRACE);
		Assert.assertEquals(lex.next_token().sym, sym.VOID);
		Assert.assertEquals(lex.next_token().sym, sym.IDENT);
		Assert.assertEquals(lex.next_token().sym, sym.LPAREN);
		Assert.assertEquals(lex.next_token().sym, sym.RPAREN);
		Assert.assertEquals(lex.next_token().sym, sym.LBRACE);
		Assert.assertEquals(lex.next_token().sym, sym.RBRACE);
		Assert.assertEquals(lex.next_token().sym, sym.RBRACE);
		Assert.assertEquals(lex.next_token().sym, sym.BOOLCONST);
		Assert.assertEquals(lex.next_token().sym, sym.STRCONST);
		Assert.assertEquals(lex.next_token().sym, sym.EOF);
	}

}
