package com.loiot.baqi.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

/**
 * POI 读取 word 2003 和 word 2007 中文字内容的测试类<br />
 * @createDate 2009-07-25
 * @author Carl He
 */
public class WordUtils {
	
	
	public static String getWordText(String filePath,String fileName)throws Exception{
		if(fileName.endsWith("docx")){
			return paseWord2007(filePath);
		}else
		if(fileName.endsWith("doc")){
			return paseWord2003(filePath);
		} 
		//return paseWord2007(filePath);
		return null;
	}
	
	
	public static String paseWord2003(String filePath) throws Exception{
				////word 2003： 图片不会被读取
				InputStream is = new FileInputStream(new File(filePath));
				WordExtractor ex = new WordExtractor(is);//is是WORD文件的InputStream 
				String text2003 = ex.getText();
				//System.out.println("2003:\br"+text2003);
		return text2003;
	}
	
	
	public static String paseWord2007(String filePath) throws Exception{
		//word 2007 图片不会被读取， 表格中的数据会被放在字符串的最后
		OPCPackage opcPackage = POIXMLDocument.openPackage(filePath);
		POIXMLTextExtractor extractor = new XWPFWordExtractor(opcPackage);
		String text2007 = extractor.getText();
		//System.out.println("2007:\br"+text2007);
		
		
		
		/*OPCPackage oPCPackage = POIXMLDocument.openPackage(filePath);
        XWPFDocument xwpf = new XWPFDocument(oPCPackage);
        POIXMLTextExtractor ex = new XWPFWordExtractor(xwpf);
        System.out.print(ex.getText());*/
		
		
		/*FileInputStream in = new FileInputStream(filePath);
		XWPFDocument document = new XWPFDocument(in);
		List<XWPFTable> tables = document.getTables();
		System.out.println(tables.size());
		XWPFTable table = tables.get(0);
		for (int i = 0; i < table.getNumberOfRows(); i++) {
		XWPFTableRow row = table.getRow(i);
		List<XWPFTableCell> cells = row.getTableCells();
		for (XWPFTableCell cell : cells) {
		List<XWPFParagraph> paragraphs = cell.getParagraphs();
		System.out.print(cell.getText() + " | ");
		}
		System.out.println();
		}*/
        
        
		return text2007;
	}
	
	
	
	
	
}