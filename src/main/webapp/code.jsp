<%@ page language="java"
         import="java.awt.*"
         import="java.awt.image.BufferedImage"
         import="java.util.*"
         import="javax.imageio.ImageIO"
         pageEncoding="utf-8"%>
<html>
<%
    response.setHeader("Cache-Control","no-cache");
    // 在内存中创建不透明的图象，宽width，高height
    int width = 60, height = 20;
    BufferedImage image = new BufferedImage(width, height,
            BufferedImage.TYPE_INT_RGB);
    //获取画笔
    Graphics g = image.getGraphics();
    //设定背景色
    g.setColor(new Color(200, 200, 200));
    //在(0,0)坐标处开始填充矩形，矩形宽width，高height
    g.fillRect(0, 0, width, height);
    //取随机产生的验证码(4位数字)
    Random rnd = new Random();
    int randNum = rnd.nextInt(8999) + 1000;
    //将整型数字转化成字符串
    String randStr = String.valueOf(randNum);
    //将验证码存入session
    session.setAttribute("randStr", randStr);
    //将验证码显示到图象中
    g.setColor(Color.black);//设置背景为黑色
    g.setFont(new Font("", Font.PLAIN, 20));//普通样式文字
    g.drawString(randStr, 10, 17);//在(10,17)坐标处显示验证码的文字
    // 随机产生100个干扰点，使图象中的验证码不易被其它程序探测到
    for (int i = 0; i < 100; i++){
        int x = rnd.nextInt(width);
        int y = rnd.nextInt(height);
        g.drawOval(x, y, 1, 1);
    }
    // 输出图象到页面
    ImageIO.write(image, "JPEG", response.getOutputStream());
    //因为JSP容器在处理完成请求后会调用releasePageConter方法释放所有的PageContestObject，并且同时调用getWriter方法。
    //由于getWriter方法与在JSP页面中使用流相关的getOutputStream方法冲突，为造成造成这种异常，加上如下两行
    out.clear();
    //保存当前的out对象，并更新PageContext中Page范围内Out对象。
    out = pageContext.pushBody();
%>
</html>