package hotel.tikki.kakaopay;


import java.io.BufferedWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;


import com.google.gson.JsonElement;
import com.google.gson.JsonParser;


public class KakaoPay {
	
	public static void payRequest() {
		String reqURL = "https://kauth.kakao.com/v1/payment/ready";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			conn.setRequestProperty("Authorization", "KakaoAK 0b9f477ab6257ea4f3146cde666a8e72");
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("cid=TC0ONETIME");
			sb.append("&partner_order_id=1001");
			sb.append("&partner_user_id=aa");
			sb.append("&item_name=deluxe");
			sb.append("&quantity=1");
			sb.append("&total_amount=1000");
			sb.append("&tax_free_amount=100");
			sb.append("&approval_url=http://localhost:8080/hotel/pay/success");
			sb.append("&cancel_url=http://localhost:8080/hotel/pay/cancel");
			sb.append("&fail_url=http://localhost:8080/hotel/pay/fail");
			
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            String tid = element.getAsJsonObject().get("tid").getAsString();
            String next_redirect_pc_url = element.getAsJsonObject().get("next_redirect_pc_url").getAsString();
            
            System.out.println("tid : " + tid);
            System.out.println("next_redirect_pc_url : " + next_redirect_pc_url);
            
            br.close();
            bw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
 
	
	
	
	
	
	
	
	
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
