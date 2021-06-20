import java.util.*;
import java.io.*;


%%
%class Analyser
%standalone
%line

//PrintCode
%{
    StringBuffer string = new StringBuffer();
    public static File file = new File("output.txt");
    public static void WriteToFile(String content) {
        try {
            FileWriter fr = new FileWriter(file, true);
            fr.write(content + "\n");
            fr.close();
        } catch (IOException e) {
            WriteToFile("An error occurred.");
            e.printStackTrace();
        }
    }
%}

// Identifiers
ID = [:jletter:] [:jletterdigit:]*

// Keywords
Keywords = boolean|break|continue|else|for|float|if|int|return|void|while 

// Operator
Arithmeric_op = "+"|"-"|"*"|"/"
Rel_op = "<"|"<="|">"|">="
Equality_op = "=="|"!="
Logical_op = "||"|"&&"|"!"
Assignment_op = "="
Operators = {Arithmeric_op}|{Rel_op}|{Equality_op}|{Logical_op}|{Assignment_op}

// Seperators
Seperators = [\{|\}|\(|\)|\[|\]|\;|\,]

// Literals
Digits = [0-9]
// Int
Int = {Digits}+
// Float
Float = {Digits}+"."{Digits}*
// Boolean
Boolean = true|false
//String
Letter = [A-Za-z]
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]
Quote = \"
String = {Quote} ({Letter} | {Digits} | {WhiteSpace})* {Quote}
Literals = {Int}|{Float}|{Boolean}|{String}


%%

{ID}            {WriteToFile(yytext() + " :   Identifiers");}
{Keywords}      {WriteToFile(yytext() + " :   Keywords");}
{Operators}     {WriteToFile(yytext() + " :   Operators");}
{Seperators}    {WriteToFile(yytext() + " :   Seperators");}
{Literals}      {WriteToFile(yytext() + " :   Literals");}