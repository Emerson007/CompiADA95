package mainPackage;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java_cup.runtime.*;


public class main {
    public static void main(String[] args) throws FileNotFoundException, IOException {
       String flexFilePath = "./src/mainPackage/lexer.flex";
        generarLexer(flexFilePath);
        
        Reader reader = new BufferedReader(new FileReader("./src/mainPackage/archivo.adb"));
        lexer x = new lexer(reader);
        while (x.yylex() == 1) {}
    }
    
     public static void generarLexer(String path){
        File f = new File(path);
        jflex.Main.generate(f);
    }
     
}