package com.talentmap.common.utils;

import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;

import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author: dangyi
 * @date: Created in 16:45 2019/11/22
 * @version: 1.0.0
 * @description:
 */
public class ExcelUtil {

    /**
     * 生成基础的sheet
     *
     * @param wb
     * @param head
     * @param title
     * @return
     */
    public static XSSFSheet buildSheet(XSSFWorkbook wb, XSSFCellStyle style, String head, String[] title) {
        XSSFSheet sheet = wb.createSheet("乡贤数据");

        XSSFCell cell0 = sheet.createRow(0).createCell(0);
        cell0.setCellValue(head);
        cell0.setCellStyle(style);
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, title.length - 1));

        XSSFRow row1 = sheet.createRow(1);
        for (int i = 0; i < title.length; i++) {
            XSSFCell cell = row1.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }

        return sheet;
    }

    /**
     * 生成Excel文件
     *
     * @param head
     * @param title
     * @param content
     * @return
     */
    public static XSSFWorkbook buildExcel(String head, String[] title, String[][] content) {
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HorizontalAlignment.CENTER);
        XSSFSheet sheet = ExcelUtil.buildSheet(wb, style, head, title);

        if (null != content && content.length != 0) {
            for (int i = 0; i < content.length; i++) {
                String[] data = content[i];
                XSSFRow row = sheet.createRow(i + 2);
                for (int j = 0; j < data.length; j++) {
                    XSSFCell cell = row.createCell(j);
                    cell.setCellValue(data[j]);
                    cell.setCellStyle(style);
                }
            }
        }

        return wb;
    }

    /**
     * 获取String类型数据
     *
     * @param row
     * @param index
     * @return
     */
    public static String getStringValue(XSSFRow row, int index) {
        XSSFCell cell = row.getCell(index);
        if (null == cell) {
            return null;
        }
        cell.setCellType(CellType.STRING);
        return cell.getStringCellValue().trim();
    }


    /**
     * 发送响应流数据到前端
     */
    public static void sendToClient(XSSFWorkbook wb, HttpServletResponse response) {
        //获取当前时间
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateNowStr = sdf.format(date);
        //Excel文件名
        String filename = dateNowStr + ".xlsx";

        //响应到前端
        try {
            setResponseHeader(response, filename);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 响应流设置
     */
    private static void setResponseHeader(HttpServletResponse response, String filename) {
        try {
            try {
                filename = new String(filename.getBytes("gb2312"), "ISO8859-1");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename=" + filename);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * 存储Excel数据
     *
     * @param wb
     */
    public static String save(XSSFWorkbook wb, String rootPath, String projectDir, String dir, String name) {
        //Excel文件名
        String filename = buildFileName(name);
        File targetFile = new File(rootPath + projectDir + dir);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }

        String filePath = rootPath + projectDir + dir + filename;
        BufferedOutputStream os = null;
        try {
            os = new BufferedOutputStream(new FileOutputStream(filePath));
            wb.write(os);
            os.flush();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (os != null) {
                    os.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return projectDir + dir + filename;
    }

    /**
     * 构建文件名称
     *
     * @return
     */
    private static String buildFileName(String name) {
        //获取当前时间
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateNowStr = sdf.format(date);
        //Excel文件名
        return name + dateNowStr + ".xlsx";
    }


    /**
     * 表头是否符合规范
     *
     * @param row
     * @param title
     * @return
     */
    public static boolean isNormTitle(XSSFRow row, String[] title) {
        for (int i = 0; i < title.length; i++) {
            if (!title[i].equals(ExcelUtil.getStringValue(row, i))) {
                return false;
            }
        }

        return true;
    }

    /**
     * 构建Excel
     *
     * @param head
     * @param title
     * @param allRows
     * @return
     */
    public static XSSFWorkbook buildDupExcel(String head, String[] title, List<XSSFRow>... allRows) {
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HorizontalAlignment.CENTER);
        XSSFSheet sheet = ExcelUtil.buildSheet(wb, style, head, title);

        XSSFCellStyle[] styles = new XSSFCellStyle[3];
        XSSFCellStyle dupStyle = wb.createCellStyle();
        XSSFFont dupFont = wb.createFont();
        dupFont.setColor(new XSSFColor(Color.BLUE));
        dupStyle.setFont(dupFont);
        styles[0] = dupStyle;
        XSSFCellStyle errStyle = wb.createCellStyle();
        XSSFFont errFont = wb.createFont();
        errFont.setColor(Font.COLOR_RED);
        errStyle.setFont(errFont);
        styles[1] = errStyle;
        XSSFCellStyle denStyle = wb.createCellStyle();
        XSSFFont denFont = wb.createFont();
        denFont.setColor(new XSSFColor(Color.GREEN));
        denStyle.setFont(denFont);
        styles[2] = denStyle;


        int r = 2;  // 当前行数
        int len = 2;    // 总长度
        int s = 0; // 样式
        for (List<XSSFRow> rows : allRows) {
            int i = 0;
            len += rows.size();
            while (r < len) {
                XSSFRow dupRow = rows.get(i++);
                XSSFRow row = sheet.createRow(r);
                for (int c = 0; c < dupRow.getLastCellNum(); c++) {
                    XSSFCell cell = row.createCell(c);
                    cell.setCellValue(getStringValue(dupRow, c));
                    cell.setCellStyle(styles[s]);
                }
                r++;
            }
            s++;
        }

        return wb;
    }
}
