package com.cn.hnust.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;


/**
 * 日志工具类
 * @author xs
 *
 */
public class LoggerUtil {
	
	/*
	 * 通过 stack trace 获取调用 LoggerUtil 日志方法的业务类名和方法，并将其作为名字空间（即日志输出格式中的 %c）
	 */
	private static String getLoggerName() {
		String loggerName = LoggerUtil.class.getName();
		Class<?>[] noArgs = null;
		try {
			Class<?> stackTraceElementClass = Class.forName("java.lang.StackTraceElement");
			Method getStackTraceMethod = Throwable.class.getMethod("getStackTrace", noArgs);
			Method getMethodNameMethod = stackTraceElementClass.getMethod("getMethodName", noArgs);
			Method getClassNameMethod = stackTraceElementClass.getMethod("getClassName", noArgs);
			Object[] elements =  (Object[]) getStackTraceMethod.invoke(new Throwable(), (Object[]) noArgs);
			int caller = 2; // getLoggerName() at [0], LoggerUtil log method at [1], business caller at [2]
			String className = (String) getClassNameMethod.invoke(elements[caller], (Object[]) noArgs);
			String methodName = (String) getMethodNameMethod.invoke(elements[caller], (Object[]) noArgs);
			loggerName = className + "." + methodName;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return loggerName;
	}
	
	/*
	 * debug
	 */
	public static void debug(String msg) {
		Logger.getLogger(getLoggerName()).log(LoggerUtil.class.getName(), Level.DEBUG, msg, null);
	}
	public static void debug(String msg, Throwable th) {
		Logger.getLogger(getLoggerName()).log(LoggerUtil.class.getName(), Level.DEBUG, msg, th);
	}
	public static boolean isDebugEnabled() {
		return Logger.getLogger(getLoggerName()).isEnabledFor(Level.DEBUG);
	}

	/*
	 * info
	 */
	public static void info(String msg) {
		Logger.getLogger(getLoggerName()).log(LoggerUtil.class.getName(), Level.INFO, msg, null);
	}
	public static void info(String msg, Throwable th) {
		Logger.getLogger(getLoggerName()).log(LoggerUtil.class.getName(), Level.INFO, msg, th);
	}
	public static boolean isInfoEnabled() {
		return Logger.getLogger(getLoggerName()).isEnabledFor(Level.INFO);
	}
	
	/*
	 * warn
	 */
	public static void warn(String msg) {
		Logger.getLogger(getLoggerName()).log(LoggerUtil.class.getName(), Level.WARN, msg, null);
	}
	public static void warn(String msg, Throwable th) {
		Logger.getLogger(getLoggerName()).log(LoggerUtil.class.getName(), Level.WARN, msg, th);
	}
	public static boolean isWarnEnabled() {
		return Logger.getLogger(getLoggerName()).isEnabledFor(Level.WARN);
	}
	
	/*
	 * error
	 */
	public static void error(String msg) {
		Logger.getLogger(getLoggerName()).log(LoggerUtil.class.getName(), Level.ERROR, msg, null);
	}
	public static void error(String msg, Throwable th) {
		Logger.getLogger(getLoggerName()).log(LoggerUtil.class.getName(), Level.ERROR, msg, th);
	}
	public static boolean isErrorEnabled() {
		return Logger.getLogger(getLoggerName()).isEnabledFor(Level.ERROR);
	}
}
