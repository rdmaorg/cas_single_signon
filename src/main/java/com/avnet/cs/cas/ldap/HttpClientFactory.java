package com.avnet.cs.cas.ldap;

import org.jasig.cas.util.HttpClient;
import org.jasig.cas.util.SimpleHttpClient;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;

/**
 * @author Kamran Zafar (N000989)
 *         Created on 09/02/2016
 */
public class HttpClientFactory {
	private static TrustManager[] trustManager = new TrustManager[] { new X509TrustManager() {
		public java.security.cert.X509Certificate[] getAcceptedIssuers() {
			return null;
		}

		public void checkClientTrusted(X509Certificate[] certs, String authType) {
		}

		public void checkServerTrusted(X509Certificate[] certs, String authType) {
		}
	} };

	private static HostnameVerifier hostnameVerifier = new HostnameVerifier() {
		public boolean verify(String hostname, SSLSession session) {
			return true;
		}
	};

	static {
		try {
			SSLContext sc = SSLContext.getInstance("TLS");
			sc.init(null, trustManager, new java.security.SecureRandom());

			HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
			HttpsURLConnection.setDefaultHostnameVerifier(hostnameVerifier);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public HttpClient create() throws Exception {
		return create(true);
	}

	public HttpClient create(Boolean followRedirect) throws Exception {
		SSLContext context = SSLContext.getInstance("TLS");
		context.init(null, trustManager, new SecureRandom());

		SimpleHttpClient simpleHttpClient = new SimpleHttpClient();
		simpleHttpClient.setSSLSocketFactory(context.getSocketFactory());
		simpleHttpClient.setConnectionTimeout(5000);
		simpleHttpClient.setReadTimeout(5000);
		simpleHttpClient.setFollowRedirects(followRedirect);
		simpleHttpClient.setHostnameVerifier(hostnameVerifier);

		return simpleHttpClient;
	}
}
