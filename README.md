# Usage

## Interpretive Xalan

```
$ make --trace xmlformatter GRAAL=/path/to/graalvm
$ ./xslt-app-1.0 test.xml
xlst = java.io.ByteArrayInputStream@3846ae69
```

## XSLTC Xalan

```
$ make --trace xmlformatter-xsltc GRAAL=/path/to/graalvm
$ ./xslt-app-1.0 -Djavax.xml.transform.TransformerFactory=org.apache.xalan.xsltc.trax.TransformerFactoryImpl test.xml 
xlst = java.io.ByteArrayInputStream@77eaa012
Exception in thread "main" com.oracle.svm.core.jdk.UnsupportedFeatureError: No classes have been predefined during the image build to load from bytecodes at runtime.
	at com.oracle.svm.core.util.VMError.unsupportedFeature(VMError.java:87)
	at com.oracle.svm.core.hub.PredefinedClassesSupport.throwNoBytecodeClasses(PredefinedClassesSupport.java:76)
	at com.oracle.svm.core.hub.PredefinedClassesSupport.loadClass(PredefinedClassesSupport.java:130)
	at java.lang.ClassLoader.defineClass(ClassLoader.java:263)
	at org.apache.xalan.xsltc.trax.TemplatesImpl$TransletClassLoader.defineClass(TemplatesImpl.java:128)
	at org.apache.xalan.xsltc.trax.TemplatesImpl.defineTransletClasses(TemplatesImpl.java:299)
	at org.apache.xalan.xsltc.trax.TemplatesImpl.getTransletInstance(TemplatesImpl.java:336)
	at org.apache.xalan.xsltc.trax.TemplatesImpl.newTransformer(TemplatesImpl.java:369)
	at org.apache.xalan.xsltc.trax.TransformerFactoryImpl.newTransformer(TransformerFactoryImpl.java:619)
	at com.example.xslt.XmlFormatter.main(XmlFormatter.java:25)
```
