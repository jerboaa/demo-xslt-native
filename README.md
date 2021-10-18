# Usage

Derived from reproducer of https://github.com/oracle/graal/issues/3811

## Interpretive Xalan

```
$ make --trace xmlformatter GRAALVM=/path/to/graalvm
$ ./xslt-app-1.0 test.xml
xlst = java.io.ByteArrayInputStream@3846ae69
```

## XSLTC Xalan

Note: Might not necessarily work due to non-determinism. Xalan is dead upstream.

```
$ make --trace xmlformatter-xsltc GRAAL=/path/to/graalvm
$ ./xslt-app-1.0 -Djavax.xml.transform.TransformerFactory=org.apache.xalan.xsltc.trax.TransformerFactoryImpl test.xml 
xlst = java.io.ByteArrayInputStream@77eaa012
```
