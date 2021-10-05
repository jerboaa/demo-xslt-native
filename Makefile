JAR=target/xslt-app-1.0.jar
GRAALVM=$(GRAAL)

$(JAR): 
	mvn clean package

cfg: $(JAR)
	$(GRAALVM)/bin/java -agentlib:native-image-agent=config-output-dir=cfg -Djavax.xml.transform.TransformerFactory=org.apache.xalan.processor.TransformerFactoryImpl -jar $(JAR) test.xml

cfg-xsltc: $(JAR)
	$(GRAALVM)/bin/java -agentlib:native-image-agent=config-output-dir=cfg -Djavax.xml.transform.TransformerFactory=org.apache.xalan.xsltc.trax.TransformerFactoryImpl -jar $(JAR) test.xml

xmlformatter: cfg
	$(GRAALVM)/bin/native-image --verbose -H:ConfigurationFileDirectories=cfg -H:+AllowIncompleteClasspath -J-Djavax.xml.transform.TransformerFactory=org.apache.xalan.processor.TransformerFactoryImpl -jar $(JAR)

xmlformatter-xsltc: cfg-xsltc
	$(GRAALVM)/bin/native-image --verbose --no-fallback -H:ConfigurationFileDirectories=cfg -H:+AllowIncompleteClasspath -J-Djavax.xml.transform.TransformerFactory=org.apache.xalan.xsltc.trax.TransformerFactoryImpl -jar $(JAR)


clean:
	rm -rf target cfg dependency-reduced-pom.xml xslt-app*
