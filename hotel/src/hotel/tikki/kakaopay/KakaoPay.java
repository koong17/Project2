package hotel.tikki.kakaopay;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;

import org.apache.catalina.filters.HttpHeaderSecurityFilter;
import org.salem.domain.KakaoPayApprovalVO;
import org.salem.domain.KakaoPayReadyVO;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
 
import lombok.extern.java.Log;
 
@Service
@Log
public class KakaoPay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    
    public String kakaoPayReady() {
 
        RestTemplate restTemplate = new RestTemplate();
 
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
