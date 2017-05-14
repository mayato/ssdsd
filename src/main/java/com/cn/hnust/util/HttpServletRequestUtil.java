package com.cn.hnust.util;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class HttpServletRequestUtil {

	public static String getBody(HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		BufferedReader reader = null;
		try {
			String line = null;
			reader = request.getReader();
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (reader != null) {
					reader.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
	
	public static JSONObject getJsonBody(HttpServletRequest request) {
		String body = getBody(request);
		return JSONObject.parseObject(body);
	}
	
	public static JSONArray getArrayBody(HttpServletRequest request) {
		String body = getBody(request);
		return JSONObject.parseArray(body);
	}
	
}
