package rs.ac.bg.etf.pp1.sv110059;
import java_cup.runtime.Scanner;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class LexFactoryTest1 {
	private Scanner lex;

	@Before
	public void SetUp() {
		lex = LexFactory.GetLex("test\\Test1.mj");
	}

	@Test
	public void testGetLex () throws java.lang.Exception {

		Assert.assertEquals(lex.next_token().sym, sym.NUMBER);
		Assert.assertEquals(lex.next_token().sym, sym.PLUS);
		Assert.assertEquals(lex.next_token().sym, sym.LPAREN);
		Assert.assertEquals(lex.next_token().sym, sym.SEMI);
		Assert.assertEquals(lex.next_token().sym, sym.SEMI);
		Assert.assertEquals(lex.next_token().sym, sym.RPAREN);
		Assert.assertEquals(lex.next_token().sym, sym.EOF);
	}

}
