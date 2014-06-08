package org.shakespearelang.bard;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;


/**
 * Test driver program for the ANTLR3 Maven Architype demo
 *
 * @author Jim Idle (jimi@temporal-wave.com)
 */
class Main {

    private static boolean makeDot = false;

    /** Just a simple test driver for the ASP parser
     * to show how to call it.
     */

    	public static void main(String[] args)
        {
            try
            {

                if  (args.length > 0)
                {
                    int s = 0;

                    if  (args[0].startsWith("-dot"))
                    {
                        makeDot = true;
                        s = 1;
                    }
                    // Recursively parse each directory, and each file on the
                    // command line
                    //
                    for (int i=s; i<args.length; i++)
                    {
                        parse(new File(args[i]));
                    }
                }
                else
                {
                    System.err.println("Usage: java -jar bard.jar <directory | filename.spl>");
                }
            }
            catch (Exception ex)
            {
                System.err.println("ANTLR demo parser threw exception:");
                ex.printStackTrace();
            }
        }

        public static void parse(File source) throws Exception
        {

            // Open the supplied file or directory
            //
            try
            {

                // From here, any exceptions are just thrown back up the chain
                //
                if (source.isDirectory())
                {
                    System.out.println("Directory: " + source.getAbsolutePath());
                    String files[] = source.list();

                    for (int i=0; i<files.length; i++)
                    {
                        parse(new File(source, files[i]));
                    }
                }


                else
                {
                    // File without paths etc
                    //
                    String sourceFile = source.getName();

                    if  (sourceFile.length() > 3)
                    {
                        // TODO can we use java file api to get the extension?
                        String suffix = sourceFile.substring(sourceFile.length()-4).toLowerCase();

                        // Check if source has the right extension
                        if  (suffix.compareTo(".spl") == 0)
                        {
                            parseSource(source.getAbsolutePath());
                        } else {
                            System.err.println("Error: unknown extension for file="+sourceFile);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.err.println("ANTLR demo parser caught error on file open:");
                ex.printStackTrace();
            }

        }

        public static void parseSource(String source) throws Exception
        {
            // Parse an ANTLR demo file
            //
            try
            {
                // First create a file stream using the povided file/path
                // and tell the lexer that that is the character source.
                
                ANTLRInputStream input=new ANTLRFileStream(source, "Cp1252");
                SPLLexer lexer = new SPLLexer(input);
              

                // Using the lexer as the token source, we create a token
                // stream to be consumed by the parser
                CommonTokenStream tokens = new CommonTokenStream(lexer);

                System.out.println("file: " + source);

                System.out.println("    Parser Start");
                long pStart = System.currentTimeMillis();
                SPLParser parser = new SPLParser(tokens);
                ParseTree tree=parser.startsymbol();
                long stop = System.currentTimeMillis();
                System.out.println("      Parsed in " + (stop - pStart) + "ms.");
              
            }
            catch (FileNotFoundException ex)
            {
                // The file we tried to parse does not exist
                //
                System.err.println("\n  !!The file " + source + " does not exist!!\n");
            }
            catch (Exception ex)
            {
                // Something went wrong in the parser, report this
                //
                System.err.println("Parser threw an exception:\n\n");
                ex.printStackTrace();
            }
        }

}
