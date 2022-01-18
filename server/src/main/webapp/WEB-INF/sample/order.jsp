<%@ page language="java" contentType="text/html;charset=euc-kr"%>

<%
    /* ============================================================================== */
    /* =   PAGE : ���� ��û PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   �� �������� ǥ������ ���ؼ� �����ڰ� ���� ��û�� �ϴ� ������             = */
    /* =   �Դϴ�. �Ʒ��� �� �ʼ�, �� �ɼ� �κа� �Ŵ����� �����ϼż� ������        = */
    /* =   �����Ͽ� �ֽñ� �ٶ��ϴ�.                                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2020  NHN KCP Inc.   All Rights Reserverd.                = */
    /* ============================================================================== */
%>
<%
    /* ============================================================================== */
    /* =   ȯ�� ���� ���� Include                                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =   �� �ʼ�                                                                  = */
    /* =   �׽�Ʈ �� �ǰ��� ������ site_conf_inc.jsp ������ �����Ͻñ� �ٶ��ϴ�.    = */
    /* = -------------------------------------------------------------------------- = */
%>
    <%@ include file="../cfg/site_conf_inc.jsp" %>
<%
    request.setCharacterEncoding ( "euc-kr" ) ;
    /* = -------------------------------------------------------------------------- = */
    /* =   ȯ�� ���� ���� Include END                                               = */
    /* ============================================================================== */
%>
<%!
    /* ============================================================================== */
    /* =   null ���� ó���ϴ� �޼ҵ�                                                = */
    /* = -------------------------------------------------------------------------- = */
        public String f_get_parm( String val )
        {
          if ( val == null ) val = "";
          return  val;
        }
    /* ============================================================================== */
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
  <title>������ ���� ����������</title>
  
  <!-- ����: font preload -->
  <link rel="preload" href="https://cdn.kcp.co.kr/font/NotoSansCJKkr-Regular.woff" type="font/woff" as="font" crossorigin>
  <link rel="preload" href="https://cdn.kcp.co.kr/font/NotoSansCJKkr-Medium.woff" type="font/woff" as="font" crossorigin>
  <link rel="preload" href="https://cdn.kcp.co.kr/font/NotoSansCJKkr-Bold.woff" type="font/woff" as="font" crossorigin>
  <!-- //����: font preload -->

  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi">  
  <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
  <meta http-equiv="Pragma" content="no-cache"> 
  <meta http-equiv="Expires" content="-1">
  <link href="/resources/css/style.css" rel="stylesheet" type="text/css" id="cssLink"/>

<script type="text/javascript">
        /****************************************************************/
        /* m_Completepayment  ����                                      */
        /****************************************************************/
        /* �����Ϸ�� ��� �Լ�                                         */
        /* �ش� �Լ����� ���� �����ϸ� �ȵ˴ϴ�.                        */
        /* �ش� �Լ��� ��ġ�� payplus.js ���ٸ��� ����Ǿ �մϴ�.    */
        /* Web ����� ��� ���� ���� form ���� �Ѿ��                   */
        /****************************************************************/
        function m_Completepayment( FormOrJson, closeEvent ) 
        {
            var frm = document.order_info; 
         
            /********************************************************************/
            /* FormOrJson�� ������ ���� Ȱ�� ����                               */
            /* frm ���� FormOrJson ���� ���� �� frm ������ Ȱ�� �ϼž� �˴ϴ�.  */
            /* FormOrJson ���� Ȱ�� �Ͻ÷��� ������������� ���ǹٶ��ϴ�.       */
            /********************************************************************/
            GetField( frm, FormOrJson ); 

            
            if( frm.res_cd.value == "0000" )
            {
                alert("���� ���� ��û ��,\n\n�ݵ�� ����â���� ������ ���� ���� �Ϸ� ��\n\n���� ���� ordr_chk �� ��ü �� �ֹ�������\n\n�ٽ� �ѹ� ���� �� ���� ���� ��û�Ͻñ� �ٶ��ϴ�."); //��ü ���� �� �ʼ� Ȯ�� ����.
                /*
                    ������ ���ϰ� ó�� ����
                */
             
                frm.submit(); 
            }
            else
            {
                alert( "[" + frm.res_cd.value + "] " + frm.res_msg.value );
                
                closeEvent();
            }
        }
</script>

<%
    /* ============================================================================== */
    /* =   Javascript source Include                                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =   �� �ʼ�                                                                  = */
    /* =   �׽�Ʈ �� �ǰ��� ������ site_conf_inc.jsp������ �����Ͻñ� �ٶ��ϴ�.     = */
    /* = -------------------------------------------------------------------------- = */
%>
    <script type="text/javascript" src="<%= g_conf_js_url %>"></script>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   Javascript source Include END                                            = */
    /* ============================================================================== */
%>
     <script type="text/javascript">
        
        
     function pay()
     {
      var frm = document.order_info;

       if (frm.pay_method[0].checked)
       {
            frm.pay_method.value="100000000000"; //�ſ�ī��
       }

       else if (frm.pay_method[1].checked)
       {
           frm.pay_method.value="010000000000"; //������ü
       }

       else if (frm.pay_method[2].checked)
       {
           frm.pay_method.value="001000000000"; //�������
       }

       else if (frm.pay_method[3].checked)
       {
           frm.pay_method.value="000010000000"; //�޴���
       }

       else if (frm.pay_method[4].checked)
       {
           frm.pay_method.value="000100000000"; //����Ʈ
       }

       else if (frm.pay_method[5].checked)
       {
           frm.pay_method.value="000000001000"; //��ǰ��
       }

       else if (frm.pay_method[6].checked)
       {
           frm.pay_method.value="111000000000"; //�ſ�ī��/������ü/�������
       }

     }
        /* ǥ���� ���� */
        function jsf__pay( form )
        {
            pay();
            
            try
            {
                KCP_Pay_Execute( form ); 
            }
            catch (e)
            {
                /* IE ���� ���� ��������� throw�� ��ũ��Ʈ ���� */ 
            }
            
        }             

        /* �ֹ���ȣ ���� ���� */
        function init_orderid()
        {
            var today = new Date();
            var year  = today.getFullYear();
            var month = today.getMonth() + 1;
            var date  = today.getDate();
            var time  = today.getTime();

            if(parseInt(month) < 10) {
                month = "0" + month;
            }

            if(parseInt(date) < 10) {
                date = "0" + date;
            }

            var order_idxx = "TEST" + year + "" + month + "" + date + "" + time;

            document.order_info.ordr_idxx.value = order_idxx;            
        }

        function close_window(){
           window.open("about:blank","_self").close();
        }
       
    </script>
</head>

<body onload="init_orderid();">

<div class="wrap">

<!-- �ֹ����� �Է� form : order_info -->
<form name="order_info" method="post" action="pp_cli_hub.jsp" >

<%
    /* ============================================================================== */
    /* =   1. �ֹ� ���� �Է�                                                        = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ �ʿ��� �ֹ� ������ �Է� �� �����մϴ�.                            = */
    /* = -------------------------------------------------------------------------- = */
%>
            <!-- header -->
            <div class="header">
                <a href="#none" onclick="close_window()" class="btn-back"><span>�ڷΰ���</span></a>
                <h1 class="title">�ֹ�/���� SAMPLE</h1>
            </div>
            <!-- //header -->
            <!-- contents -->
            <div id="skipCont" class="contents">
                <p class="txt-type-1">�� �������� ������ ��û�ϴ� ���� �������Դϴ�.</p>
                <p class="txt-type-2">�ҽ� ���� �� [�� �ʼ�] �Ǵ� [�� �ɼ�] ǥ�ð� ���Ե� ������ �������� ��Ȳ�� �°� ������ ���� �����Ͻñ� �ٶ��ϴ�.</p>
                <!-- �ֹ����� -->
                <h2 class="title-type-3">�ֹ�����</h2>
                <ul class="list-type-1">
                    <!-- �ֹ���ȣ(ordr_idxx) -->
                    <li>
                        <div class="left"><p class="title">�ֹ���ȣ</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="ordr_idxx" value="" maxlength="40" />
                                <a href="#none" class="btn-clear"></a>
                            </div>
                        </div>
                    </li>
                    <!-- ��ǰ��(good_name) -->
                    <li>
                        <div class="left"><p class="title">��ǰ��</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="good_name" value="�����" />
                                <a href="#none" class="btn-clear"></a>
                            </div>
                        </div>
                    </li>
                    <!-- �����ݾ�(good_mny) - �� �ʼ� : �� ������ ,(�޸�)�� ������ ���ڸ� �Է��Ͽ� �ֽʽÿ�. -->
                    <li>
                        <div class="left"><p class="title">��ǰ�ݾ�</p></div>
                        <div class="right">
                            <div class="ipt-type-1 gap-2 pc-wd-2">
                                <input type="text" name="good_mny" value="35000" maxlength="9" />
                                    <a href="#none" class="btn-clear"></a>
                                <span class="txt-price">��</span>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="line-type-1"></div>
                <!-- �ֹ����� -->
                <h2 class="title-type-3">�ֹ�����</h2>
                <ul class="list-type-1">
                    <!-- �ֹ��ڸ�(buyr_name) -->
                    <li>
                        <div class="left"><p class="title">�ֹ��ڸ�</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="buyr_name" value="������" />
                                <a href="#none" class="btn-clear"></a>
                            </div>
                        </div>
                    </li>
                    <!-- �ֹ��� ����ó1(buyr_tel1) -->
                    <li>
                        <div class="left"><p class="title">��ȭ��ȣ</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="buyr_tel1" value="02-0000-0000" />
                                <a href="#none" class="btn-clear"></a>
                            </div>
                        </div>
                    </li>
                    <!-- �޴�����ȣ(buyr_tel2) -->
                    <li>
                        <div class="left"><p class="title">�޴�����ȣ</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="buyr_tel2" value="010-0000-0000" />
                                <a href="#none" class="btn-clear"></a>
                            </div>
                        </div>
                    </li>
                    <!-- �ֹ��� E-mail(buyr_mail) -->
                    <li>
                        <div class="left"><p class="title">�̸���</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="buyr_mail" value="test@test.co.kr" />
                                <a href="#none" class="btn-clear"></a>
                            </div>
                        </div>
                    </li>
                </ul> 
                <div class="line-type-1"></div>
<%
                /* ============================================================================== */
                /* =   ���� ���� ���� ����                                                 = */
                /* = -------------------------------------------------------------------------- = */
                /* =   ������ �ʿ��� ���� ���� ������ �����մϴ�.                               = */
                /* =                                                                            = */
                /* =  �ſ�ī�� : 100000000000, ������ü : 010000000000, ������� : 001000000000 = */
                /* =  ����Ʈ   : 000100000000, �޴���   : 000010000000, ��ǰ��   : 000000001000 = */
                /* =                                                                            = */
                /* =  ���� ���� ������ ��� ǥ�������� ������ ���������� ǥ�õ˴ϴ�.            = */
                /* =  ǥ�������� ���� ���������� ǥ���ϰ� ������ ��� �����Ͻ÷��� ����         = */
                /* =  ���ܿ� �ش��ϴ� ��ġ�� �ش��ϴ� ���� 1�� �����Ͽ� �ֽʽÿ�.               = */
                /* =                                                                            = */
                /* =  ��) �ſ�ī��, ������ü, ������¸� ���ÿ� ǥ���ϰ��� �ϴ� ���            = */
                /* =  pay_method = "111000000000"                                               = */
                /* =  �ſ�ī��(100000000000), ������ü(010000000000), �������(001000000000)��  = */
                /* =  �ش��ϴ� ���� ��� �����ָ� �˴ϴ�.                                       = */
                /* =                                                                            = */
                /* = �� �ʼ�                                                                    = */
                /* =  KCP�� ��û�� �����������θ� ������ �����մϴ�.                            = */
                /* = -------------------------------------------------------------------------- = */
%>
                <h2 class="title-type-3">��������</h2>
                <ul class="list-check-1">
                    <li>
                        <input type="radio" id="radio-2-1" class="ipt-radio-1" name="pay_method" value="100000000000" checked />
                        <label for="radio-2-1"><span class="ico-radio"><span></span></span>�ſ�ī��</label>
                    </li>
                    <li>
                        <input type="radio" id="radio-2-2" class="ipt-radio-1" name="pay_method" value="010000000000" />
                        <label for="radio-2-2"><span class="ico-radio"><span></span></span>������ü</label>
                    </li>
                    <li>
                        <input type="radio" id="radio-2-3" class="ipt-radio-1" name="pay_method" value="001000000000" />
                        <label for="radio-2-3"><span class="ico-radio"><span></span></span>�������</label>
                    </li>
                    <li>
                        <input type="radio" id="radio-2-4" class="ipt-radio-1" name="pay_method" value="000010000000" />
                        <label for="radio-2-4"><span class="ico-radio"><span></span></span>�޴���</label>
                    </li>
                    <li>
                        <input type="radio" id="radio-2-5" class="ipt-radio-1" name="pay_method" value="000100000000" />
                        <label for="radio-2-5"><span class="ico-radio"><span></span></span>����Ʈ</label>
                    </li>
                    <li>
                        <input type="radio" id="radio-2-6" class="ipt-radio-1" name="pay_method" value="000000001000" />
                        <label for="radio-2-6"><span class="ico-radio"><span></span></span>��ǰ��</label>
                    </li>
                    <li>
                        <input type="radio" id="radio-2-8" class="ipt-radio-1" name="pay_method" value="111000000000" />
                        <label for="radio-2-8"><span class="ico-radio"><span></span></span>�ſ�ī��/������ü/�������</label>
                    </li>
                </ul>
                <div Class="Line-Type-1"></div>
                <ul class="list-btn-2">
                    <!-- D : ��ư ��Ȱ���� a�±׿� class disable �߰� -->
                    <li class="pc-only-show"><a href="#none" onclick="close_window()" class="btn-type-3 pc-wd-2">�ڷ�</a></li>
                    <li><a href="#none" onclick="jsf__pay(document.order_info);" class="btn-type-2 pc-wd-3">������û</a></li>     
                </ul>
            </div>
            <!-- //contents -->

            <div class="grid-footer">
                <div class="inner">
                    <!-- footer -->
                    <div class="footer">
                        �� NHN KCP Corp.
                    </div>
                    <!-- //footer -->
                </div>
            </div>
            
            <!-- ����: js -->
            <script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
            <script type="text/javascript" src="../static/js/front.js"></script>
            <!-- //����: js -->  

                                        
                                        
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   1. �ֹ� ���� �Է� END                                                    = */
    /* ============================================================================== */
%>

<%
    /* ============================================================================== */
    /* =   2. ������ �ʼ� ���� ����                                                 = */
    /* = -------------------------------------------------------------------------- = */
    /* =   �� �ʼ� - ������ �ݵ�� �ʿ��� �����Դϴ�.                               = */
    /* =   site_conf_inc.jsp ������ �����ϼż� �����Ͻñ� �ٶ��ϴ�.                 = */
    /* = -------------------------------------------------------------------------- = */
    // ��û���� : ����(pay)/���,����(mod) ��û�� ���
%>
    <input type="hidden" name="req_tx"          value="pay" />
    <input type="hidden" name="site_cd"         value="<%= g_conf_site_cd   %>" />
    <input type="hidden" name="site_name"       value="<%= g_conf_site_name %>" />
    <input type="hidden" name="pay_method" value=""> <!-- ���� ���� -->
<%
    /*
       �Һοɼ� : ǥ�������� ī������� �ִ�� ǥ���� �Һΰ��� ���� �����մϴ�.(0 ~ 18 ���� ���� ����)
       �� ����  - �Һ� ������ �����ݾ��� 50,000�� �̻��� ��쿡�� ����, 50000�� �̸��� �ݾ��� �Ͻúҷθ� ǥ��˴ϴ�
                  ��) value ���� "5" �� �������� ��� => ī������� ����â�� �ϽúҺ��� 5�������� ���ð���
    */
%>
    <input type="hidden" name="quotaopt"        value="12"/>
    <!-- �ʼ� �׸� : ���� �ݾ�/ȭ����� -->
    <input type="hidden" name="currency"        value="WON"/>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   2. ������ �ʼ� ���� ���� END                                             = */
    /* ============================================================================== */
%>

<%
    /* ============================================================================== */
    /* =   3. ǥ���� �ʼ� ����(���� �Ұ�)                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ �ʿ��� �ֹ� ������ �Է� �� �����մϴ�.                            = */
    /* = -------------------------------------------------------------------------- = */
%>
    <!-- ǥ���� ���� �����Դϴ�(���� �Ұ�) -->
    <input type="hidden" name="module_type"     value="<%= module_type %>"/>
<!--
      �� �� ��
          �ʼ� �׸� : ǥ�������� ���� �����ϴ� �κ����� �ݵ�� ���ԵǾ�� �մϴ�
          ���� �������� ���ʽÿ�
-->
    <input type="hidden" name="res_cd"          value=""/>
    <input type="hidden" name="res_msg"         value=""/>
    <input type="hidden" name="enc_info"        value=""/>
    <input type="hidden" name="enc_data"        value=""/>
    <input type="hidden" name="ret_pay_method"  value=""/>
    <input type="hidden" name="tran_cd"         value=""/>
    <input type="hidden" name="use_pay_method"  value=""/>
    
    <!-- �ֹ����� ���� ���� ���� : ǥ���� ���� �����ϴ� �����Դϴ� -->
    <input type="hidden" name="ordr_chk"        value=""/>

    <!--  ���ݿ����� ���� ���� : ǥ���� ���� �����ϴ� �����Դϴ� -->
    <input type="hidden" name="cash_yn"         value=""/>
    <input type="hidden" name="cash_tr_code"    value=""/>
    <input type="hidden" name="cash_id_info"    value=""/>

    <!-- 2012�� 8�� 18�� ���ڻ�ŷ��� ���� ���� ���� �κ� -->
    <!-- ���� �Ⱓ ���� 0:��ȸ�� 1:�Ⱓ����(ex 1:2012010120120131)  -->
    <input type="hidden" name="good_expr" value="0">

<%
    /* = -------------------------------------------------------------------------- = */
    /* =   3. ǥ���� �ʼ� ���� END                                          = */
    /* ============================================================================== */
%>

<%
    /* ============================================================================== */
    /* =   4. �ɼ� ����                                                             = */
    /* = -------------------------------------------------------------------------- = */
    /* =   �� �ɼ� - ������ �ʿ��� �߰� �ɼ� ������ �Է� �� �����մϴ�.             = */
    /* = -------------------------------------------------------------------------- = */

    /* ���ī�� ���� ���� �Ķ���� �Դϴ�.(���հ���â ���� ����)
    <input type="hidden" name="used_card_YN"        value="Y"/> */
    /* ���ī�� ���� �Ķ���� �Դϴ�. (�ش� ī�常 ����â�� ���̰� �����ϴ� �Ķ�����Դϴ�. used_card_YN ���� Y�϶� ����˴ϴ�.
    /<input type="hidden" name="used_card"        value="CCBC:CCKM:CCSS"/> */

    /* �ſ�ī�� ������ OKĳ���� ���� ���θ� ���� â�� �����ϴ� �Ķ���� �Դϴ�
         ����Ʈ �������� ��쿡�� â�� �������ϴ�
        <input type="hidden" name="save_ocb"        value="Y"/> */

    /* ���� �Һ� ���� �� ����
        value���� "7" �� �������� ��� => ī������� ����â�� �Һ� 7������ ���ð���
    <input type="hidden" name="fix_inst"        value="07"/> */

    /*  ������ �ɼ�
            �� �����Һ�    (������ ������ �������� ���� �� ������ ������ ������)                             - "" �� ����
            �� �Ϲ��Һ�    (KCP �̺�Ʈ �̿ܿ� ���� �� ��� ������ ������ �����Ѵ�)                           - "N" �� ����
            �� ������ �Һ� (������ ������ �������� ���� �� ������ �̺�Ʈ �� ���ϴ� ������ ������ �����Ѵ�)   - "Y" �� ����
    <input type="hidden" name="kcp_noint"       value=""/> */

    /*  ������ ����
            �� ���� 1 : �Һδ� �����ݾ��� 50,000 �� �̻��� ��쿡�� ����
            �� ���� 2 : ������ �������� ������ �ɼ��� Y�� ��쿡�� ���� â�� ����
            ��) BC 2,3,6����, ���� 3,6����, �Ｚ 6,9���� ������ : CCBC-02:03:06,CCKM-03:06,CCSS-03:06:04
    <input type="hidden" name="kcp_noint_quota" value="CCBC-02:03:06,CCKM-03:06,CCSS-03:06:09"/> */


    /* �ؿ�ī�� �����ϴ� �Ķ���� �Դϴ�.(�ؿܺ���, �ؿܸ�����, �ؿ�JCB�� �����Ͽ� ǥ��)
    <input type="hidden" name="used_card_CCXX"        value="Y"/> */

    /*  ������� ���� ���� �Ķ����
         �� �ش� ������ ����â���� ���̰� �մϴ�.(�����ڵ�� �Ŵ����� ����)
    <input type="hidden" name="wish_vbank_list" value="05:03:04:07:11:23:26:32:34:81:71"/> */

    /*  ������� �Ա� ���� �����ϴ� �Ķ���� - �߱��� + 3��
    <input type="hidden" name="vcnt_expire_term" value="3"/> */

    /*  ������� �Ա� �ð� �����ϴ� �Ķ����
         HHMMSS�������� �Է��Ͻñ� �ٶ��ϴ�
         ������ ���Ͻô°�� �⺻������ 23��59��59�ʰ� ������ �˴ϴ�
         <input type="hidden" name="vcnt_expire_term_time" value="120000"/> */

    /* ����Ʈ ������ ���� ����(�ſ�ī��+����Ʈ) ���θ� ������ �� �ֽ��ϴ�.- N �ϰ�� ���հ��� ������
        <input type="hidden" name="complex_pnt_yn" value="N"/>    */

    /* ���ݿ����� ��� â�� ��� ���θ� �����ϴ� �Ķ���� �Դϴ�
         �� Y : ���ݿ����� ��� â ���
         �� N : ���ݿ����� ��� â ��� ���� 
    �� ���� : ���ݿ����� ��� �� KCP ���������� ���������� ���ݿ����� ��� ���Ǹ� �ϼž� �մϴ�
        <input type="hidden" name="disp_tax_yn"     value="Y"/> */

    /* ����â�� ������ ����Ʈ�� �ΰ� ǥ���� ���� ��ܿ� ����ϴ� �Ķ���� �Դϴ�
       ��ü�� �ΰ� �ִ� URL�� ��Ȯ�� �Է��ϼž� �ϸ�, �ִ� 150 X 50  �̸� ũ�� ����

    �� ���� : �ΰ� �뷮�� 150 X 50 �̻��� ��� site_name ���� ǥ�õ˴ϴ�.
        <input type="hidden" name="site_logo"       value="" /> */

    /* ����â ���� ǥ�� �Ķ���� �Դϴ�. ������ �⺻���� ����Ͻ÷��� Y�� �����Ͻñ� �ٶ��ϴ�
        2010-06�� ���� �ſ�ī��� ������¸� �����˴ϴ�
        <input type="hidden" name="eng_flag"      value="Y"> */

    /* KCP�� ������ǰ�� �������ǰ�� ���ÿ� �Ǹ��ϴ� ��ü���� ���������� ���� ���Ǽ��� �����ص帮����, 
        ���հ��� ���� ����Ʈ�ڵ带 ������ �帮�� �� �ݾ׿� ���� ���հ��� ó���� �����ϵ��� �����ϰ� �ֽ��ϴ�
        ���հ��� ���� ����Ʈ �ڵ�� ����Ͻ� ���������� �ش��� �˴ϴ�
        ��ǰ���� �ƴ϶� �ݾ����� �����Ͽ� ��û�ϼž� �մϴ�
        �Ѱ��� �ݾ��� �����ݾ� + �ΰ��� + ������ݾ��� �հ� ���ƾ� �մϴ�. 
        (good_mny = comm_tax_mny + comm_vat_mny + comm_free_mny)
        
        <input type="hidden" name="tax_flag"       value="TG03">  <!-- ����Ұ�    -->
        <input type="hidden" name="comm_tax_mny"   value=""    >  <!-- �����ݾ�    --> 
        <input type="hidden" name="comm_vat_mny"   value=""    >  <!-- �ΰ���     -->
        <input type="hidden" name="comm_free_mny"  value=""    >  <!-- ����� �ݾ� --> */

    /* skin_indx ���� ��Ų�� ������ �� �ִ� �Ķ�����̸� �� 7������ �����˴ϴ�. 
        ������ ���Ͻø� 1���� 7���� ���� �־��ֽñ� �ٶ��ϴ�. 

        <input type="hidden" name="skin_indx"      value="1"> */

    /* ��ǰ�ڵ� ���� �Ķ���� �Դϴ�.(��ǰ���� ���� �����Ͽ� ó���� �� �ִ� �ɼǱ���Դϴ�.)
        <input type="hidden" name="good_cd"      value=""> */
        
    /* ���������� �����ϴ� �� ���̵� ������ �ؾ� �մϴ�. ��ǰ�� ���� �� �ݵ�� �Է��Ͻñ� �ٶ��ϴ�.
        <input type="hidden" name="shop_user_id"    value=""/> */
        
    /* ��������Ʈ ������ �������� �Ҵ�Ǿ��� �ڵ� ���� �Է��ؾ��մϴ�.
        <input type="hidden" name="pt_memcorp_cd"   value=""/> */

    /* ����â�� ��ܹ����� ������ �� �ִ� �Ķ���� �Դϴ�.
       <input type="hidden" name="kcp_pay_title"   value="��ܹ����߰�"/> */
    /* = -------------------------------------------------------------------------- = */
    /* =   4. �ɼ� ���� END                                                         = */
    /* ============================================================================== */
%>
    </form>
</div>
<!--//wrap-->
</body>
</html>