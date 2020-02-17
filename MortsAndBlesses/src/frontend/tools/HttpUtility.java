package frontend.tools;

import java.io.*;
import java.net.*;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static java.net.HttpURLConnection.HTTP_OK;

public class HttpUtility {

	public static final int METHOD_GET = 0; // METHOD GET
	public static final int METHOD_POST = 1; // METHOD POST

	// Callback interface
	public interface Callback {
		// abstract methods
		public void OnSuccess(String response);

		public void OnError(int status_code, String message);
	}

	// static method
	public static void newRequest(HttpServletRequest req, HttpServletResponse res, String web_url, int method,
			HashMap<String, String> params, Callback callback) {

		// thread for handling async task

		try {
			String url = web_url;
			// write GET params,append with url
			if (method == METHOD_GET && params != null) {
				for (Map.Entry<String, String> item : params.entrySet()) {
					String key = URLEncoder.encode(item.getKey(), "UTF-8");
					String value = URLEncoder.encode(item.getValue(), "UTF-8");
					if (!url.contains("?")) {
						url += "?" + key + "=" + value;
					} else {
						url += "&" + key + "=" + value;
					}
				}
			}

			HttpURLConnection urlConnection = (HttpURLConnection) new URL(url).openConnection();
			urlConnection.setUseCaches(false);
			urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); // handle url encoded
																									// form data
			urlConnection.setRequestProperty("charset", "utf-8");
			HttpServletRequest request1 = (HttpServletRequest) req;
			HttpSession session = request1.getSession();
			if (session.getAttribute("token") != null)
				System.out.println("session: " + session.getAttribute("token"));
				urlConnection.setRequestProperty("Authorization", "Bearer " + session.getAttribute("token"));

			if (method == METHOD_GET) {
				urlConnection.setRequestMethod("GET");
			} else if (method == METHOD_POST) {
				urlConnection.setDoOutput(true); // write POST params
				urlConnection.setRequestMethod("POST");
			}

			// write POST data
			if (method == METHOD_POST && params != null) {
				StringBuilder postData = new StringBuilder();
				for (Map.Entry<String, String> item : params.entrySet()) {
					if (postData.length() != 0)
						postData.append('&');
					postData.append(URLEncoder.encode(item.getKey(), "UTF-8"));
					postData.append('=');
					postData.append(URLEncoder.encode(String.valueOf(item.getValue()), "UTF-8"));
				}
				byte[] postDataBytes = postData.toString().getBytes("UTF-8");
				urlConnection.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
				urlConnection.getOutputStream().write(postDataBytes);

			}
			// server response code
			int responseCode = urlConnection.getResponseCode();
			if (responseCode == HTTP_OK && callback != null) {
				BufferedReader reader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
				StringBuilder response = new StringBuilder();
				String line;
				while ((line = reader.readLine()) != null) {
					response.append(line);
				}
				// callback success
				callback.OnSuccess(response.toString());
				reader.close(); // close BufferReader
			} else if (callback != null) {
				// callback error
				callback.OnError(responseCode, urlConnection.getResponseMessage());
			}

			urlConnection.disconnect(); // disconnect connection
		} catch (IOException e) {
			e.printStackTrace();
			if (callback != null) {
				// callback error
				callback.OnError(500, e.getLocalizedMessage());
			}
		}
	}
}