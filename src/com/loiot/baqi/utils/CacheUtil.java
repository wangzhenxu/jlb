/**
 * timeloit.com Inc.
 * Copyright (c) 2011-2012 All Rights Reserved.
 */
package com.loiot.baqi.utils;

import java.util.concurrent.TimeoutException;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loiot.commons.cache.BaseLoiotPojo;

/**
 * @Id $Id: CacheUtil.java 5457 2012-02-17 08:14:23Z yulianyu $
 * @author yulianyu
 */
@Service
public class CacheUtil {

	@Autowired
	private MemcachedClient memcachedClient1;
	@Autowired
	private MemcachedClient memcachedClient2;

	/*
	 * 获取一个缓冲数值
	 */
	public Object get(String key){
		Object value = null;
		try {
			value = memcachedClient1.get(key);
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		}
		if(value == null){
			try {
				value = memcachedClient2.get(key);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return value;
	}

	/*
	 * 设置一个缓存数值
	 */
	public boolean put(String key, String data,int exp) {
		boolean result = false;
		try {
			result = memcachedClient1.set(key, exp, data);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
			    memcachedClient2.set(key, exp, data);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/*
	 * 设置一个缓存数值
	 */
	public boolean add(String key, Object data, int exp) {
		boolean result = false;
		try {
			result = memcachedClient1.add(key, exp, data);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		} finally {
			try {
				memcachedClient2.add(key, exp, data);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		return result;
	}
	
	/*
	 * 设置一个缓存数值
	 */
	public boolean put(String key, Object data) {
		boolean result = false;
		try {
			return memcachedClient1.set(key, 0, data);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		} finally {
			try {
				memcachedClient2.set(key, 0, data);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 

		return result;
	}
	
	/**
	 * 设置一个对象到memcache
	 * 
	 * @param pojo
	 * @return
	 */
	public boolean put(BaseLoiotPojo pojo){
		return put(pojo.getMemkey(), pojo);
	}

	/*
	 * 设置一个缓存数值
	 */
	public boolean delete(String key) {
		boolean result = false;
		try {
			return memcachedClient1.delete(key);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		} finally {
			try {
				memcachedClient2.delete(key);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 在键值后面新增
	 * @param key
	 * @param val
	 * @return
	 */
	public boolean append(String key, Object val){
		boolean result = false;
		try {
			return memcachedClient1.append(key, val,0);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		} finally {
			try {
				memcachedClient2.append(key, val,0);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 增加数值
	 * 
	 * @param key
	 * @param by
	 * @return
	 * @throws MemcachedException 
	 * @throws InterruptedException 
	 * @throws TimeoutException 
	 */
	public long incr(String key,int by){
		long result = 0 ;
		try {
			result = memcachedClient1.incr(key, by);
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		} finally {
			try {
				result = memcachedClient2.incr(key, by);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
