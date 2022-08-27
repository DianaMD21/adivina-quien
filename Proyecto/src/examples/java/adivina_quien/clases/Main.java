package adivina_quien.clases;

import adivina_quien.clases.Opening;
import org.jpl7.Query;
import org.jpl7.Term;

import java.util.Iterator;
import java.util.Map;


public class Main {
    public static void main(String[] args) {
        Term t = Term.textToTerm("consult('C:/Users/diana/OneDrive/Documents/GitHub/AkinatorPL/Proyecto/src/examples/java/adivina_quien/clases/adivina_quien.pl')");
        Query.hasSolution(t);
        //Query textract=new Query("retractall(cierto(_))");
        //textract.hasSolution();
        //Query textract2=new Query("retractall(falso(_))");
        //textract2.hasSolution();
        //Iterator<Map<String, Term>> solutionsIter = new Query("resuelve(coloca(pais,Cual)).");

        //Query q2 = new Query("listing(cierto)");
        //System.err.println("Es " + (q2.hasSolution() ? "provable" : "not provable"));

        Query q3=new Query("assertz(cierto(continenete(pais,europa)))");
        q3.hasSolution();
        Query q4=new Query("assertz(cierto(continenete(pais,america)))");
        q4.hasSolution();
        Query q7=new Query("probando(X)");
        q7.hasSolution();
        Iterator<Map<String, Term>> solutionsIter = new Query("probando(X)");
        System.out.println("hiii");
        while (solutionsIter.hasNext()) {
            Map<String, Term> sol = solutionsIter.next();
            System.out.println("Estamos aqui");
            System.out.println("\t Solution found: " + sol.toString());
            Query.oneSolution(String.format("assertz(testingcosas(%s))", sol.get("X").toString()));
        }
        Query q2 = new Query("listing(testingcosas)");
        System.err.println("Es " + (q2.hasSolution() ? "provable" : "not provable"));
        Opening home=new Opening();
        home.setVisible(true);

    }
}
