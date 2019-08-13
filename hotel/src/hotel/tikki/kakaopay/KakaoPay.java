package hotel.tikki.kakaopay;

import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

public class KakaoPay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    
    public String kakaoPayReady(String authorize_code) {
    	String access_Token = "";
    	String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/v1/payment/ready";
        
        try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("cid=authorization_code");
            sb.append("&client_id=ec92d2854a2481b9f4735c5c1164cc8b");
            sb.append("&redirect_uri=http://10.10.10.177:8080/hotel/oauth");
            sb.append("&code=" + authorize_code);
            System.out.println(sb.toString());
            bw.write(sb.toString());
            bw.flush();
			
		} catch (Exception e) {
			// TODO: handle exception
			
		}
        
        
        
        
        // 서버로 요청할 Header
        HttpHeader headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "admin key");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("cid", "TC0ONETIME");
        params.put("partner_order_id", "1001");
        params.put("partner_user_id", "aa");
        params.put("item_name", "deluxe");
        params.put("quantity", "1");
        params.put("total_amount", "2100");
        params.put("tax_free_amount", "100");
        params.put("approval_url", "http://localhost:8080/kakaoPaySuccess");
        params.put("cancel_url", "http://localhost:8080/kakaoPayCancel");
        params.put("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
}
