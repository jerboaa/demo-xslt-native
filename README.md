# Usage

Derived from reproducer of https://github.com/oracle/graal/issues/3811

## Interpretive Xalan

See master branch

## XSLTC Xalan (JDK 17.0.1+)

```
$ make --trace xmlformatter-xsltc-jdk GRAAL=/path/to/graalvm
$ ./xslt-app-1.0 test.xml 
xlst = java.io.ByteArrayInputStream@3c9d8f45
Exception in thread "main" java.lang.InternalError
	at jdk.internal.misc.Unsafe.objectFieldOffset(Unsafe.java:78)
	at java.lang.ClassLoader.trySetObjectField(ClassLoader.java:2696)
	at java.lang.ClassLoader.createOrGetClassLoaderValueMap(ClassLoader.java:2675)
	at java.lang.System$2.createOrGetClassLoaderValueMap(System.java:2300)
	at jdk.internal.loader.AbstractClassLoaderValue.map(AbstractClassLoaderValue.java:266)
	at jdk.internal.loader.AbstractClassLoaderValue.get(AbstractClassLoaderValue.java:94)
	at java.lang.ModuleLayer.bindToLoader(ModuleLayer.java:963)
	at java.lang.Module.defineModules(Module.java:1266)
	at java.lang.ModuleLayer.<init>(ModuleLayer.java:185)
	at java.lang.ModuleLayer.defineModules(ModuleLayer.java:670)
	at java.lang.ModuleLayer.defineModules(ModuleLayer.java:423)
	at com.sun.org.apache.xalan.internal.xsltc.trax.TemplatesImpl.lambda$createModule$1(TemplatesImpl.java:444)
	at java.security.AccessController.doPrivileged(AccessController.java:87)
	at com.sun.org.apache.xalan.internal.xsltc.trax.TemplatesImpl.createModule(TemplatesImpl.java:446)
	at com.sun.org.apache.xalan.internal.xsltc.trax.TemplatesImpl.defineTransletClasses(TemplatesImpl.java:496)
	at com.sun.org.apache.xalan.internal.xsltc.trax.TemplatesImpl.getTransletInstance(TemplatesImpl.java:554)
	at com.sun.org.apache.xalan.internal.xsltc.trax.TemplatesImpl.newTransformer(TemplatesImpl.java:587)
	at com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl.newTransformer(TransformerFactoryImpl.java:834)
	at com.example.xslt.XmlFormatter.main(XmlFormatter.java:25)
```
