package com.loiot.baqi.model;

import com.timeloit.pojo.Customer;
import com.timeloit.pojo.MpCustomer;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 客户下  公众帐号列表
 * Author: sf
 * CreateDate: 13-10-24 上午10:06
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MpCustomerGroup implements java.io.Serializable {


    private static final long serialVersionUID = -3838789140090848463L;

//    private Customer customer;
    private long customerId;
    private String customerName;
    private List<MpCustomer> mpCustomerList;
}
