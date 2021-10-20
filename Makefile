JAR=target/xslt-app-1.0.jar

$(JAR): 
	mvn clean package

cfg: $(JAR)
	$(GRAALVM)/bin/java -agentlib:native-image-agent=config-output-dir=cfg,experimental-class-define-support -Djavax.xml.transform.TransformerFactory=org.apache.xalan.processor.TransformerFactoryImpl -jar $(JAR) test.xml

cfg-xsltc-jdk: $(JAR)
	$(GRAALVM)/bin/java -agentlib:native-image-agent=config-output-dir=cfg-xsltc,experimental-class-define-support -jar $(JAR) test.xml

xmlformatter-xsltc-jdk: cfg-xsltc-jdk
	$(GRAALVM)/bin/native-image --verbose -J--add-exports=java.xml/com.sun.org.apache.xalan.internal.xsltc.runtime=ALL-UNNAMED \
	-J--add-exports=java.xml/com.sun.org.apache.xalan.internal.xsltc=ALL-UNNAMED --no-fallback -H:ConfigurationFileDirectories=cfg-xsltc -H:+AllowIncompleteClasspath -jar $(JAR)

clean:
	rm -rf target cfg cfg-xsltc dependency-reduced-pom.xml xslt-app*
