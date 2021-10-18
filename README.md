# Usage

Derived from reproducer of https://github.com/oracle/graal/issues/3811

## Interpretive Xalan

See master branch

## XSLTC Xalan (JDK 17.0.1+)

```
$ make --trace xmlformatter-xsltc GRAAL=/path/to/graalvm
$ ./xslt-app-1.0 test.xml 
xlst = java.io.ByteArrayInputStream@77eaa012
```
