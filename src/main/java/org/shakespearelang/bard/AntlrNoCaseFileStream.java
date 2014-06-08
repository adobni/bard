
package org.shakespearelang.bard;

import java.io.IOException;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CharStream;


 
 
/**
 *
 * @author Jim Idle
 */
public class AntlrNoCaseFileStream  extends ANTLRFileStream {
    public AntlrNoCaseFileStream(String fileName) throws IOException {
        super(fileName, null);
    }
 
    public AntlrNoCaseFileStream(String fileName, String encoding)
    throws IOException {
        super(fileName, encoding);
    }
 
    @Override
    public int LA(int i) {
        if ( i==0 ) {
            return 0; // undefined
        }
        if ( i<0 ) {
            i++; // e.g., translate LA(-1) to use offset 0
        }
 
        if ( (p+i-1) >= n ) {
 
            return CharStream.EOF;
        }
        return Character.toLowerCase(data[p+i-1]);
    }
}