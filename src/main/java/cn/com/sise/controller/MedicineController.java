package cn.com.sise.controller;

import cn.com.sise.dao.MedicineDao;
import cn.com.sise.pojo.Medicine;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MedicineController {
    @Resource
    private MedicineDao medicineDao;

    @RequestMapping(value="/showAllMedicine")
    public String showAllMedicine(HttpSession session, HttpServletRequest request) throws Exception {
        List<Medicine> allmedicine = new ArrayList<Medicine>();
        //总记录数
        int pageRecords=0;
        try {
            allmedicine = medicineDao.queryAll();
            pageRecords=allmedicine.size();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        session.setAttribute("medicine", allmedicine);
        //添加分页功能
        //获取当前的页码
        String pageIndex=request.getParameter("pageIndex");
        if (pageIndex==null) {
            pageIndex = "1";
        }
        //每页显示5条记录
        int pageSize= 5;
        //总页数
        int pageCount;
        if (allmedicine!= null) {
            if(pageRecords%pageSize==0){
                pageCount =pageRecords/pageSize;
            }else{
                pageCount = pageRecords/pageSize+1;
            }
            request.setAttribute("pageCount", pageCount);
            session.setAttribute("medicineCount",pageRecords);
        }
        //获取指定页面的数据
        int currentPageIndex = Integer.parseInt(pageIndex);
        ArrayList pageMedicine= new ArrayList();

        for(int i=0;i<pageRecords;i++){

            if(i>=(currentPageIndex-1)*pageSize&&i<(currentPageIndex)*pageSize){
                pageMedicine.add(allmedicine.get(i));
            }

        }
        session.setAttribute("medicine", pageMedicine);
        request.setAttribute("currentPageIndex", currentPageIndex);
        return "medicineList";
    }

    @RequestMapping(value="/addMedicine")
    public String addMedicine(Medicine medicine,MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        System.out.println(file);
        //2.收集图书信息，将所获取到的信息封装到Book类的实例中
        try {
            //3.上传图片到E：\pic
            //获得Part对象
            String dirPath= request.getServletContext().getRealPath("/upload/");
            File uploadFileDir = new File(dirPath);
            //File uploadFileDir = new File("E:/pic/");
            System.out.println(uploadFileDir);

            String originalFilename=file.getOriginalFilename();

            if(!uploadFileDir.exists()){
                uploadFileDir.mkdir();
            }
            System.out.println("新文件名："+originalFilename);
            System.out.println("上传文件的原始名：" + originalFilename + "<br>");
            System.out.println("上传文件的大小：" + file.getSize() + "<br>");
            if(file != null){
                //上传到服务器的upload目录中
                System.out.println("file不空");
                file.transferTo(new File(dirPath+originalFilename));
            }
            System.out.println("文件上传到：" + uploadFileDir + File.separator + originalFilename);
            //4.调用BookServiceImpl的add方法将图书信息添加到数据库中
            medicine.setPic(originalFilename);
            medicineDao.medicineInsert(medicine);

            response.getWriter().print("<script>alert('添加成功！');window.location.href='showAllMedicine'</script>");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            response.getWriter().print("<script>alert('添加失败！');window.location.href='showAllMedicine'</script>");
        }
        return null;
    }

    @RequestMapping(value="/editMedicine")
    public String editMedicine(Medicine medicine,MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        System.out.println(file);
        //2.收集图书信息，将所获取到的信息封装到Book类的实例中
        try {
            //3.上传图片到E：\pic
            //获得Part对象
            String dirPath= request.getServletContext().getRealPath("/upload/");
            File uploadFileDir = new File(dirPath);
            //File uploadFileDir = new File("E:/pic/");
            System.out.println(uploadFileDir);

            String originalFilename=file.getOriginalFilename();

            if(!uploadFileDir.exists()){
                uploadFileDir.mkdir();
            }
            System.out.println("新文件名："+originalFilename);
            System.out.println("上传文件的原始名：" + originalFilename + "<br>");
            System.out.println("上传文件的大小：" + file.getSize() + "<br>");
            if(file != null){
                //上传到服务器的upload目录中
                System.out.println("file不空");
                file.transferTo(new File(dirPath+originalFilename));
            }
            System.out.println("文件上传到：" + uploadFileDir + File.separator + originalFilename);
            //4.调用BookServiceImpl的add方法将图书信息添加到数据库中
            medicine.setPic(originalFilename);
            medicineDao.medicineUpdate(medicine);

            response.getWriter().print("<script>alert('修改成功！');window.location.href='showAllMedicine'</script>");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            response.getWriter().print("<script>alert('修改失败！');window.location.href='showAllMedicine'</script>");
        }
        return null;
    }

    @RequestMapping(value="/showSomeMedicine")
    public String showSomeMedicine(String word,HttpSession session,HttpServletRequest request) {
        int pageRecords=0;
        String selectName=request.getParameter("word");
        System.out.println(word);
        List<Medicine> allMedicine=null;

        try {
            allMedicine = medicineDao.medicineSelect(word);
            pageRecords=allMedicine.size();
            session.setAttribute("medicine", allMedicine);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //添加分页功能
        //获取当前的页码
        String pageIndex=request.getParameter("pageIndex");
        System.out.println(pageIndex);
        if (pageIndex==null) {
            pageIndex = "1";
        }
        //每页显示5条记录
        int pageSize= 5;
        //总页数
        int pageCount;
        if (allMedicine!= null) {
            if(pageRecords%pageSize==0){
                pageCount =pageRecords/pageSize;
            }else{
                pageCount = pageRecords/pageSize+1;
            }
            session.setAttribute("pageCount2", pageCount);
            session.setAttribute("medicineCount2",pageRecords);
        }
        //获取指定页面的数据
        int currentPageIndex = Integer.parseInt(pageIndex);
        ArrayList pageMedicine= new ArrayList();

        for(int i=0;i<pageRecords;i++){

            if(i>=(currentPageIndex-1)*pageSize&&i<(currentPageIndex)*pageSize){
                pageMedicine.add(allMedicine.get(i));
            }
            System.out.println(pageMedicine);
        }
        session.setAttribute("medicine2", pageMedicine);
        request.setAttribute("currentPageIndex2", currentPageIndex);
        request.setAttribute("word", word);

        return "medicineSomeList";
    }

    @RequestMapping(value="/delMedicine")
    public String delMedicine(int id,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        try {
            medicineDao.medicineDelete(id);
            response.getWriter().write("<script>alert('删除成功');window.location.href='showAllMedicine'</script>");
            return null;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        response.getWriter().write("<script>alert('删除失败');window.location.href='showAllMedicine'</script>");
        return null;
    }

    @RequestMapping(value="/showOneMedicine")
    public String showOneMedicine(int id, HttpServletRequest request) {
        Medicine medicine = new Medicine();

        try {
            medicine = medicineDao.queryMedicine(id);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        HttpSession session=request.getSession();
        session.setAttribute("medicine", medicine);
        return "medicineEdit";
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(String filename,HttpServletRequest request) throws IOException {
        String path=request.getRealPath("/upload/");
        File file=new File(path+File.separator+filename);
        System.out.println(path+File.separator+filename);
        HttpHeaders headers=new HttpHeaders();
        headers.setContentDispositionFormData("attachment",filename);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
    }


    public String getFilename(HttpServletRequest request,String filename) throws UnsupportedEncodingException {
        String[] IEKeyWords={"MSIE","Trident","Edge"};
        String userAgent=request.getHeader("User-Agent");
        for (String KeyWord:IEKeyWords){
            if(userAgent.contains(KeyWord)){
                return URLEncoder.encode(filename,"UTF-8");
            }
        }
        return new String(filename.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);

    }

    @RequestMapping(value="/medicineAdd")
    public String tomedicineAdd() {
        return "medicineAdd";
    }

    @RequestMapping(value="/medicineEdit")
    public String tomedicineEdit() {
        return "medicineEdit";
    }

    @RequestMapping(value="/medicineList")
    public String tomedicineList() {
        return "medicineList";
    }

    @RequestMapping(value="/medicineSomeList")
    public String tomedicineSomeList() {
        return "medicineSomeList";
    }

}
