package org.jpl7.junit;

import java.util.HashMap;
import java.util.Map;
import org.jpl7.*;
import org.jpl7.Integer; // prefer to java.lang.Integer
import org.jpl7.fli.Prolog;
import static org.junit.Assert.*;
import org.junit.Test;

public class Test_Dict extends JPLTest {

    public static void main(String argv[]) {
        // To be able to call it from CLI without IDE (e.g., by CMAKE)
        org.junit.runner.JUnitCore.main(Test_Dict.class.getName()); // full name with package
    }

    @Test
    public void test_dict1() {
        Map<Atom, Term> map = new HashMap<Atom, Term>();
        map.put(new Atom("x"), new org.jpl7.Integer(12));
        map.put(new Atom("y"), new org.jpl7.Integer(23));
        map.put(new Atom("z"), new Integer(312));
        Dict dict = new Dict(new Atom("location"), map);
        assertEquals("location{x:12, z:312, y:23}", dict.toString());
        assertEquals(Prolog.DICT, dict.type());
    }

    @Test
    public void test_dict2() {
        Term t = Term.textToTerm("location{x:12, z:312, y:23}");
        assertEquals(Prolog.DICT, t.type());
        Dict d = (Dict) Term.textToTerm("location{x:12, z:312, y:23}");
        assertEquals(Prolog.DICT, d.type());
    }


    @Test
    public void test_dict3() {
        Term t = new Query("X = location{x:there(12,2), z:here(312,2), y:23}").oneSolution().get("X");
        Term t2 = Term.textToTerm("location{x:there(12,2), z:here(312,2), y:23}");
        Term t3 = Term.textToTerm("location{t:12, z:312, y:23}");
        assertEquals(Prolog.DICT, t.type());
        assertEquals(t2, t);
        assertNotEquals(t3, t);
    }

    @Test
    public void test_dict4() {
        Map<Atom, Term> map = new HashMap<Atom, Term>();
        map.put(new Atom("x"), new org.jpl7.Integer(12));
        map.put(new Atom("y"), new org.jpl7.Integer(23));
        map.put(new Atom("z"), new Integer(312));
        Dict dict = new Dict(new Variable("W"), map);
        assertEquals("W{x:12, z:312, y:23}", dict.toString());
        assertEquals(Prolog.DICT, dict.type());
    }

    @Test
    public void test_dict5() {
        Term t = new Query("current_prolog_flag(abi_version, X)").oneSolution().get("X");
        assertEquals(Prolog.DICT, t.type());
        Dict d = (Dict) t;
        assertEquals(new Atom("abi"), d.getTag());
    }
}
