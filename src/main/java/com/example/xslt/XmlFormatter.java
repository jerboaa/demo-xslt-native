package com.example.xslt;

import java.io.*;
import java.nio.file.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;
import org.w3c.dom.*;

public class XmlFormatter {
    public static void main(String[] args) throws Exception {
        var xmlPath = Path.of(args[0]);
        var dbf = DocumentBuilderFactory.newInstance();
        var db = dbf.newDocumentBuilder();
        Document doc;
        try (var is = Files.newInputStream(xmlPath)) {
            doc = db.parse(is);
        }
        var tf = TransformerFactory.newInstance();

        Transformer transformer;
        try (var xlst = XmlFormatter.class.getClassLoader().getResourceAsStream("formatter.xlst")) {
            System.out.println("xlst = " + xlst);
            transformer = tf.newTransformer(new StreamSource(xlst));
        }

        var domSource = new DOMSource(doc);
        try (var os = Files.newOutputStream(xmlPath)) {
            var streamResult = new StreamResult(os);
            transformer.transform(domSource, streamResult);
        }
    }
}

