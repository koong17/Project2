package hotel.tikki.kakaopay;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import hotel.tikki.reserve.model.ReserveVO;

public class KakaoPay {
	
	public static JsonElement payRequest(String roomType, int priceview, int rsrv_num) {
		String reqURL = "https://kapi.kakao.com/v1/payment/ready";
		JsonElement element = null;
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
			sb.append("&item_name= "+roomType);
			sb.append("&quantity=1");
			sb.append("&total_amount="+priceview);
			sb.append("&tax_free_amount="+(priceview/10));
			sb.append("&approval_url=http://10.10.10.178:8080/hotel/successpay?rsrv_num="+rsrv_num);
			sb.append("&cancel_url=http://10.10.10.178:8080/hotel/cancelpay?rsrv_num="+rsrv_num);
			sb.append("&fail_url=http://10.10.10.178:8080/hotel/failpay?rsrv_num="+rsrv_num);
			
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
            element = parser.parse(result);
            
            String tid = element.getAsJsonObject().get("tid").getAsString();
            String next_redirect_pc_url = element.getAsJsonObject().get("next_redirect_pc_url").getAsString();
            
            System.out.println("tid : " + tid);
            System.out.println("next_redirect_pc_url : " + next_redirect_pc_url);
            
            br.close();
            bw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return element;
	}
}
