package hotel.tikki.kakaopay;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequestMapping("/kakao")
public class KakaoPay {
   
   // 카카오페이 결제 준비
   public ResponseEntity<String> kakaopay(HttpSession session, HttpServletRequest request) throws Exception{
      
      int cseq = Integer.parseInt(request.getParameter("cseq"));
      int rseq = Integer.parseInt(request.getParameter("rseq"));
      String uid = (String)session.getAttribute("uid");
      
      CourseVO course = cService.read(cseq);
      
      String params = "?cid=TC0ONETIME"
            + "&partner_order_id=TEAM150"
            + "&partner_user_id=" + uid
            + "&item_name=" + course.getCname().replaceAll(" ", "")
            + "&quantity=1"
            + "&total_amount=" + course.getCprice()
            + "&tax_free_amount=" + (Integer.parseInt(course.getCprice()) / 10 * 9)
            + "&approval_url=http://localhost/payment/success?rseq=" + rseq
            + "&cancel_url=http://localhost/payment/fail"
            + "&fail_url=http://localhost/payment/fail"; 
      
      String response = "";
      
      try {
         URL url = new URL("https://kapi.kakao.com/v1/payment/ready" + params);
         URLConnection conn = url.openConnection();
         conn.setRequestProperty("Authorization", "KakaoAK df38a1f49cee7fd61e93b9c0164a5c12");
         conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
         ((HttpURLConnection)conn).setRequestMethod("POST");
         conn.setDoInput(true);
            conn.setDoOutput(true);
         
         
         BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
          
           String inputLine;
           while((inputLine = in.readLine()) != null) { // response 출력
               response += inputLine;
           }
    
           in.close();


      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return new ResponseEntity<String>(response, HttpStatus.OK);
   }
}