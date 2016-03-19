package mainPackage;
import java_cup.runtime.*;

%%

%class lexer //se crea la clase llamada lexer
%int
%unicode //soporte de unicode
%line //enciende conteo de lineas
%column //enciende conteo de columnas
%caseless //ignora sensibilidad a mayusculas o minusculas
//%cup

%{//atributos de la clase
  StringBuffer string = new StringBuffer();

  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}

FinLinea = \r|\n|\r\n
InputCaracter = [^\r\n]
EspacioBlanco = {FinLinea} | [ \t\f]
Identificador = [:jletter:] [:jletterdigit:]*
NumeroDecimal = 0 | [1-9](_?[0-9])*
NumeroFloat = 0 | [0-9]+.[0-9](_?[0-9])*
Boolean = true|false
Caracter = \'.\'

/* comments */
Comentario = "--" {InputCaracter}* {FinLinea}?

%state STRING


%%



/* Palabras Reservadas */
<YYINITIAL> "put"       { System.out.println("<Put>"); return 1; }
<YYINITIAL> "get"       { System.out.println("<Get>"); return 1; }
<YYINITIAL> "new"       { System.out.println("<New>"); return 1; }
<YYINITIAL> "null"      { System.out.println("<Null>"); return 1; }
<YYINITIAL> "out"       { System.out.println("<Out>"); return 1; }
<YYINITIAL> "procedure" { System.out.println("<Procedure>"); return 1; }
<YYINITIAL> "return"    { System.out.println("<Return>"); return 1; }
<YYINITIAL> "then"      { System.out.println("<Then>"); return 1; }
<YYINITIAL> "when"      { System.out.println("<When>"); return 1; }
<YYINITIAL> "declare"   { System.out.println("<Declare>"); return 1; }
<YYINITIAL> "end"       { System.out.println("<End>"); return 1; }
<YYINITIAL> "exit"      { System.out.println("<Exit>"); return 1; }
<YYINITIAL> "for"       { System.out.println("<For>"); return 1; }
<YYINITIAL> "function"  { System.out.println("<Function>"); return 1; }
<YYINITIAL> "do"        { System.out.println("<Do>"); return 1; }
<YYINITIAL> "else"      { System.out.println("<Else>"); return 1; }
<YYINITIAL> "goto"      { System.out.println("<Goto>"); return 1; }
<YYINITIAL> "if"        { System.out.println("<If>"); return 1; }
<YYINITIAL> "in"        { System.out.println("<In>"); return 1; }
<YYINITIAL> "is"        { System.out.println("<Is>"); return 1; }
<YYINITIAL> "begin"     { System.out.println("<Begin>"); return 1; }
<YYINITIAL> "while"     { System.out.println("<While>"); return 1; }
<YYINITIAL> "loop"      { System.out.println("<Loop>"); return 1; }
<YYINITIAL> "in out"    { System.out.println("<In_Out>"); return 1; }
<YYINITIAL> "integer"   { System.out.println("<Integer>"); return 1; }
<YYINITIAL> "boolean"   { System.out.println("<Boolean>"); return 1; }
<YYINITIAL> "float"     { System.out.println("<Float>"); return 1; }
<YYINITIAL> "with"      { System.out.println("<With>"); return 1; }
<YYINITIAL> "use"       { System.out.println("<Use>"); return 1; }
<YYINITIAL> "mod"       { System.out.println("<Mod>"); return 1; }

/* Operadores */
<YYINITIAL> ":="        { System.out.println("<Asig, \":=\">"); return 1; }
//booleanos
<YYINITIAL> "and"       { System.out.println("<OpBool, \"and\">"); return 1; }
<YYINITIAL> "not"       { System.out.println("<OpBool, \"not\">"); return 1; }
<YYINITIAL> "or"        { System.out.println("<OpBool, \"or\">"); return 1; }
//comparacion
<YYINITIAL> "/="        { System.out.println("<OpRel, \"/=\">"); return 1; }
<YYINITIAL> "<"         { System.out.println("<OpRel, \"<\">"); return 1; }
<YYINITIAL> ">"         { System.out.println("<OpRel, \">\">"); return 1; }
<YYINITIAL> "<="        { System.out.println("<OpRel, \"<=\">"); return 1; }
<YYINITIAL> "="         { System.out.println("<OpRel, \"=\">"); return 1; }
<YYINITIAL> ">="        { System.out.println("<OpRel, \">=\">"); return 1; }
//aritmeticos
<YYINITIAL> "+"         { System.out.println("<OpSuma, \"+\">"); return 1; }
<YYINITIAL> "*"         { System.out.println("<OpMult, \"*\">"); return 1; }
<YYINITIAL> "-"         { System.out.println("<OpResta, \"-\">"); return 1; }
<YYINITIAL> "**"        { System.out.println("<OpExp, \"**\">"); return 1; }
<YYINITIAL> "/"         { System.out.println("<OpDiv, \"/\">"); return 1; }
/* Otros */
<YYINITIAL> "("         { System.out.println("<ABREPARENTESIS>"); return 1; }
<YYINITIAL> ")"         { System.out.println("<CIERRAPARENTESIS>"); return 1; }
<YYINITIAL> ","         { System.out.println("<Coma>"); return 1; }
<YYINITIAL> "#"         { System.out.println("<Numeral>"); return 1; }
<YYINITIAL> "&"         { System.out.println("<OpConcat>"); return 1; }
<YYINITIAL> "'"         { System.out.println("<Apostrofe>"); return 1; }
<YYINITIAL> ".."         { System.out.println("<Rango>"); return 1; }
<YYINITIAL> ":"         { System.out.println("<Dos Puntos>"); return 1; }
<YYINITIAL> ";"         { System.out.println("<PuntoComa>"); return 1; }
<YYINITIAL> "."         { System.out.println("<Punto>"); return 1; }

<STRING> {
    \\t                 { string.append('\t'); }
    \\n                 { string.append('\n'); }
    \\r                 { string.append('\r'); }
    \"                  { yybegin(YYINITIAL); System.out.println("<String, \"" + string.toString() + "\">"); return 1; }
    [^\n\r\"\\]+        { string.append( yytext() ); }
    \\\"                { string.append('\"'); }
    \\                  { string.append('\\'); }
}

<YYINITIAL> {
    {Identificador}     { System.out.println("<ID, \"" + yytext() + "\">"); return 1; }
    \"                  { string.setLength(0); yybegin(STRING); }
    {NumeroFloat}       { System.out.println("<Float, \"" + yytext() + "\">"); return 1; }
    {Boolean}           { System.out.println("<Bool, \"" + yytext() + "\">"); return 1; }
    {NumeroDecimal}     { System.out.println("<Num, \"" + yytext() + "\">"); return 1; }
    {Comentario}        { System.out.println("<Comentario>");}
    {EspacioBlanco}     {}
    {Caracter}          { System.out.println("<Caracter, \""+yytext()+"\">"); }
}

[^]                     { System.out.println("No se encuentra token: " + yytext()); return 0; }2
