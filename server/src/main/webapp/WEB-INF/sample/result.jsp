<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ���� ��� ��� PAGE                                               = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ��û ������� ����ϴ� �������Դϴ�.                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2020  NHN KCP Inc.   All Rights Reserverd.                = */
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
<%
    request.setCharacterEncoding("euc-kr") ;
    /* ============================================================================== */
    /* =   ���� ���                                                                = */
    /* = -------------------------------------------------------------------------- = */
    String site_cd          = f_get_parm( request.getParameter( "site_cd"        ) );      // ����Ʈ �ڵ�
    String req_tx           = f_get_parm( request.getParameter( "req_tx"         ) );      // ��û ����(����/���)
    String use_pay_method   = f_get_parm( request.getParameter( "use_pay_method" ) );      // ��� ���� ����
    String bSucc            = f_get_parm( request.getParameter( "bSucc"          ) );      // ��ü DB ����ó�� �Ϸ� ����
    /* = -------------------------------------------------------------------------- = */
    String res_cd           = f_get_parm( request.getParameter( "res_cd"         ) );      // ��� �ڵ�
    String res_msg          = f_get_parm( request.getParameter( "res_msg"        ) );      // ��� �޽���
    String res_msg_bsucc    = "";
    /* = -------------------------------------------------------------------------- = */
    String amount           = f_get_parm( request.getParameter( "amount"         ) );      // KCP ���� �ŷ� �ݾ�
    String ordr_idxx        = f_get_parm( request.getParameter( "ordr_idxx"      ) );      // �ֹ���ȣ
    String tno              = f_get_parm( request.getParameter( "tno"            ) );      // KCP �ŷ���ȣ
    String good_name        = f_get_parm( request.getParameter( "good_name"      ) );      // ��ǰ��
    String buyr_name        = f_get_parm( request.getParameter( "buyr_name"      ) );      // �����ڸ�
    String buyr_tel1        = f_get_parm( request.getParameter( "buyr_tel1"      ) );      // ������ ��ȭ��ȣ
    String buyr_tel2        = f_get_parm( request.getParameter( "buyr_tel2"      ) );      // ������ �޴�����ȣ
    String buyr_mail        = f_get_parm( request.getParameter( "buyr_mail"      ) );      // ������ E-Mail
    /* = -------------------------------------------------------------------------- = */
    // ����
    String pnt_issue        = f_get_parm( request.getParameter( "pnt_issue"      ) );      // ����Ʈ ���񽺻�
    String app_time         = f_get_parm( request.getParameter( "app_time"       ) );      // ���νð� (����)
    /* = -------------------------------------------------------------------------- = */
    // �ſ�ī��
    String card_cd          = f_get_parm( request.getParameter( "card_cd"        ) );      // ī�� �ڵ�
    String card_name        = f_get_parm( request.getParameter( "card_name"      ) );      // ī���
    String noinf            = f_get_parm( request.getParameter( "noinf"          ) );      // ������ ����
    String quota            = f_get_parm( request.getParameter( "quota"          ) );      // �Һΰ���
    String app_no           = f_get_parm( request.getParameter( "app_no"         ) );      // ���ι�ȣ
    /* = -------------------------------------------------------------------------- = */
    // ������ü
    String bank_name        = f_get_parm( request.getParameter( "bank_name"      ) );      // �����
    String bank_code        = f_get_parm( request.getParameter( "bank_code"      ) );      // �����ڵ�
    /* = -------------------------------------------------------------------------- = */
    // �������
    String bankname         = f_get_parm( request.getParameter( "bankname"       ) );      // �Ա��� ����
    String depositor        = f_get_parm( request.getParameter( "depositor"      ) );      // �Ա��� ���� ������
    String account          = f_get_parm( request.getParameter( "account"        ) );      // �Ա��� ���� ��ȣ
    String va_date          = f_get_parm( request.getParameter( "va_date"        ) );      // ������� �Աݸ����ð�
    /* = -------------------------------------------------------------------------- = */
    // ����Ʈ
    String add_pnt          = f_get_parm( request.getParameter( "add_pnt"        ) );      // �߻� ����Ʈ
    String use_pnt          = f_get_parm( request.getParameter( "use_pnt"        ) );      // ��밡�� ����Ʈ
    String rsv_pnt          = f_get_parm( request.getParameter( "rsv_pnt"        ) );      // ���� ����Ʈ
    String pnt_app_time     = f_get_parm( request.getParameter( "pnt_app_time"   ) );      // ���νð�
    String pnt_app_no       = f_get_parm( request.getParameter( "pnt_app_no"     ) );      // ���ι�ȣ
    String pnt_amount       = f_get_parm( request.getParameter( "pnt_amount"     ) );      // �����ݾ� or ���ݾ�
    /* = -------------------------------------------------------------------------- = */
    //�޴���
    String commid           = f_get_parm( request.getParameter( "commid"         ) );      // ��Ż� �ڵ�
    String mobile_no        = f_get_parm( request.getParameter( "mobile_no"      ) );      // �޴��� ��ȣ
    /* = -------------------------------------------------------------------------- = */
    //��ǰ��
    String tk_van_code      = f_get_parm( request.getParameter( "tk_van_code"    ) );      // �߱޻� �ڵ�
    String tk_app_no        = f_get_parm( request.getParameter( "tk_app_no"      ) );      // ���� ��ȣ
    /* = -------------------------------------------------------------------------- = */
    // ���ݿ�����
    String cash_yn          = f_get_parm( request.getParameter( "cash_yn"        ) );      // ���� ������ ��� ����
    String cash_authno      = f_get_parm( request.getParameter( "cash_authno"    ) );      // ���� ������ ���� ��ȣ
    String cash_tr_code     = f_get_parm( request.getParameter( "cash_tr_code"   ) );      // ���� ������ ���� ����
    String cash_id_info     = f_get_parm( request.getParameter( "cash_id_info"   ) );      // ���� ������ ��� ��ȣ
    String cash_no          = f_get_parm( request.getParameter( "cash_no"        ) );      // ���� ������ �ŷ� ��ȣ    
    /* ============================================================================== */

    String req_tx_name = "";

    if     ( req_tx.equals( "pay" ) ) 
    {
        req_tx_name = "����" ;
    }
    else if( req_tx.equals( "mod" ) )
    {
        req_tx_name = "���/����" ;
    }

    /* ============================================================================== */
    /* =   ������ �� DB ó�� ���н� �� ��� �޽��� ����                           = */
    /* = -------------------------------------------------------------------------- = */

    if ( "pay".equals ( req_tx ) )
    {
        // ��ü DB ó�� ����
        if ( "false".equals ( bSucc ) )
        {
            if ( "0000".equals ( res_cd ) )
            {
                res_msg_bsucc = "������ ���������� �̷�������� ���θ����� ���� ����� ó���ϴ� �� ������ �߻��Ͽ� �ý��ۿ��� �ڵ����� ��� ��û�� �Ͽ����ϴ�. <br> ���θ��� ��ȭ�Ͽ� Ȯ���Ͻñ� �ٶ��ϴ�." ;
            }
            else
            {
                res_msg_bsucc = "������ ���������� �̷�������� ���θ����� ���� ����� ó���ϴ� �� ������ �߻��Ͽ� �ý��ۿ��� �ڵ����� ��� ��û�� �Ͽ�����, <br> <b>��Ұ� ���� �Ǿ����ϴ�.</b><br> ���θ��� ��ȭ�Ͽ� Ȯ���Ͻñ� �ٶ��ϴ�." ;
            }
        }
    }

    /* = -------------------------------------------------------------------------- = */
    /* =   ������ �� DB ó�� ���н� �� ��� �޽��� ���� ��                        = */
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
  
  <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
  <meta http-equiv="Pragma" content="no-cache"> 
  <meta http-equiv="Expires" content="-1">
  <link href="../static/css/style.css" rel="stylesheet" type="text/css" id="cssLink"/>
  <script type="text/javascript">
        /* �ſ�ī�� ������ */ 
        /* �ǰ����� : "https://admin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=card_bill&tno=" */ 
        /* �׽�Ʈ�� : "https://testadmin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=card_bill&tno=" */ 
         function receiptView( tno, ordr_idxx, amount ) 
        {
            receiptWin = "https://testadmin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=card_bill&tno=";
            receiptWin += tno + "&";
            receiptWin += "order_no=" + ordr_idxx + "&"; 
            receiptWin += "trade_mony=" + amount ;

            window.open(receiptWin, "", "width=455, height=815"); 
        }

        /* ���� ������ */ 
        /* �ǰ����� : "https://admin8.kcp.co.kr/assist/bill.BillActionNew.do" */ 
        /* �׽�Ʈ�� : "https://testadmin8.kcp.co.kr/assist/bill.BillActionNew.do" */   
        function receiptView2( cash_no, ordr_idxx, amount ) 
        {
            receiptWin2 = "https://testadmin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=cash_bill&cash_no=";
            receiptWin2 += cash_no + "&";             
            receiptWin2 += "order_id="     + ordr_idxx + "&";
            receiptWin2 += "trade_mony="  + amount ;

            window.open(receiptWin2, "", "width=370, height=625"); 
        }

        /* ���� ���� �����Ա� ������ ȣ�� */
        /* �׽�Ʈ�ÿ��� ��밡�� */
        /* �ǰ����� �ش� ��ũ��Ʈ �ּ�ó�� */
        function receiptView3() 
        {
            receiptWin3 = "http://devadmin.kcp.co.kr/Modules/Noti/TEST_Vcnt_Noti.jsp"; 
            window.open(receiptWin3, "", "width=520, height=300"); 
        }
    </script>
</head>

<body>
<div class="wrap">
    <form name="cancel" method="post">
    <!-- header -->
        <div class="header">
            <a href="../index.html" class="btn-back"><span>�ڷΰ���</span></a>
            <h1 class="title">��� ���</h1>
        </div>
        <!-- //header -->
        <!-- contents -->
        <div id="skipCont" class="contents">
            <p class="txt-type-1">�� �������� ���� ����� ����ϴ� ����(����) �������Դϴ�.</p>
            <p class="txt-type-2">��û ����� ����ϴ� ������ �Դϴ�.<br />��û�� ���������� ó���� ��� ����ڵ�(res_cd)���� 0000���� ǥ�õ˴ϴ�.</p>
            <h2 class="title-type-3">ó�����</h2>
<%
    /* ============================================================================== */
    /* =   ���� ��� �ڵ� �� �޽��� ���(����������� �ݵ�� ������ֽñ� �ٶ��ϴ�.)= */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ���� : res_cd���� 0000���� �����˴ϴ�.                              = */
    /* =   ���� ���� : res_cd���� 0000�̿��� ������ �����˴ϴ�.                     = */
    /* = -------------------------------------------------------------------------- = */
%>
            <ul class="list-type-1">
                <!-- ��� �ڵ� -->
                <li>
                    <div class="left"><p class="title">����ڵ�</p></div>
                    <div class="right"><div class="ipt-type-1 pc-wd-2"><%= res_cd %></div></div>
                </li>
                <!-- ��� �ڵ� -->
                <li>
                    <div class="left"><p class="title">����޼���</p></div>
                    <div class="right"><div class="ipt-type-1 pc-wd-2"><%= res_msg %></div></div>
                </li>
<%
    // ó�� ������(pp_cli_hub.jsp)���� ������ DBó�� �۾��� ������ ��� �󼼸޽����� ����մϴ�.
    if( !"".equals ( res_msg_bsucc ) )
    {
%>
                <li>
                    <div class="left"><p class="title">��� �� �޼���</p></div>
                    <div class="right"><div class="ipt-type-1 pc-wd-2"><%= res_msg_bsucc %></div></div>
                </li>              
<%
    }
%>
            </ul>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ��� �ڵ� �� �޽��� ��� ��                                         = */
    /* ============================================================================== */
%>

<%
    /* ============================================================================== */
    /* =   01. ���� ��� ���                                                       = */
    /* = -------------------------------------------------------------------------- = */
    if ( "pay".equals ( req_tx ) )
    {
        /* ============================================================================== */
        /* =   01-1. ��ü DB ó�� ����(bSucc���� false�� �ƴ� ���)                     = */
        /* = -------------------------------------------------------------------------- = */
        if ( ! "false".equals ( bSucc ) )
        {
            /* ============================================================================== */
            /* =   01-1-1. ���� ������ ���� ��� ��� ( res_cd���� 0000�� ���)             = */
            /* = -------------------------------------------------------------------------- = */
            if ( "0000".equals ( res_cd ) )
            {
%>
                <div class="line-type-1"></div>
                <!-- �ֹ����� -->
                <h2 class="title-type-3">�ֹ�����</h2>
                <ul class="list-type-1">
                    <!-- �ֹ���ȣ(ordr_idxx) -->
                    <li>
                        <div class="left"><p class="title">�ֹ���ȣ</p></div>
                        <div class="right"><div class="ipt-type-1 pc-wd-2"><%= ordr_idxx %></div></div>
                    </li>
                    <!-- KCP �ŷ���ȣ(tno) -->
                    <li>
                        <div class="left"><p class="title">KCP �ŷ���ȣ</p></div>
                        <div class="right"><div class="ipt-type-1 pc-wd-2"><%= tno %></div></div>
                    </li>
                    <!-- ��ǰ��(good_name) -->
                    <li>
                        <div class="left"><p class="title">��ǰ��</p></div>
                        <div class="right"><%= good_name %></div>
                    </li>
                    <!-- �����ݾ�(amount) -->
                    <li>
                        <div class="left"><p class="title">�����ݾ�</p></div>
                        <div class="right"><%= amount %>��</div>
                    </li>
                    <!-- �ֹ��ڸ�(buyr_name) -->
                    <li>
                        <div class="left"><p class="title">�ֹ��ڸ�</p></div>
                        <div class="right"><%= buyr_name %></div>
                    </li>
                    <!-- �ֹ��� ����ó1(buyr_tel1) -->
                    <li>
                        <div class="left"><p class="title">��ȭ��ȣ</p></div>
                        <div class="right"><%= buyr_tel1 %></div>
                    </li>
                    <!-- �޴�����ȣ(buyr_tel2) -->
                    <li>
                        <div class="left"><p class="title">�޴�����ȣ</p></div>
                        <div class="right"><%= buyr_tel2 %></div>
                    </li>
                    <!-- �ֹ��� E-mail(buyr_mail) -->
                    <li>
                        <div class="left"><p class="title">E-mail</p></div>
                        <div class="right"><%= buyr_mail %></div>
                    </li>
                </ul>                
                <div class="line-type-1"></div>
            
<%
                   /* ============================================================================== */
                   /* =   �ſ�ī�� ���� ��� ���                                             = */
                   /* = -------------------------------------------------------------------------- = */
               if ( use_pay_method.equals("100000000000") )
                {
%>
            
                <div class="line-type-1"></div>
                <!-- �ֹ����� -->
                <h2 class="title-type-3">�ſ�ī�� ����</h2>
                <ul class="list-type-1">
                    <!-- �������� : �ſ�ī�� -->
                    <li>
                        <div class="left"><p class="title">���� ����</p></div>
                        <div class="right">�ſ�ī��</div>
                    </li>
                    <!-- ���� ī�� -->
                    <li>
                        <div class="left"><p class="title">���� ī��</p></div>
                        <div class="right"><%= card_cd %> / <%= card_name %></div>
                    </li>
                    <!-- ���νð� -->
                    <li>
                        <div class="left"><p class="title">���� �ð�</p></div>
                        <div class="right"><%= app_time %></div>
                    </li>
                    <!-- ���ι�ȣ -->
                    <li>
                        <div class="left"><p class="title">���� ��ȣ</p></div>
                        <div class="right"><%= app_no %></div>
                    </li>
                    <!-- �Һΰ��� -->
                    <li>
                        <div class="left"><p class="title">�Һ� ����</p></div>
                        <div class="right"><%= quota %></div>
                    </li>
                    <!-- ������ ���� -->
                    <li>
                        <div class="left"><p class="title">������ ����</p></div>
                        <div class="right"><%= noinf %></div>
                    </li>
<%                  
                    
                    /* ============================================================================== */
                    /* =   �ſ�ī�� ������ ���                                                     = */
                    /* = -------------------------------------------------------------------------- = */
                    /* =   ���� �ŷ��ǿ� ���ؼ� �������� ����� �� �ֽ��ϴ�.                        = */
                    /* = -------------------------------------------------------------------------- = */
%>

                    <li>
                        <div class="left"><p class="title">������ Ȯ��</p></div>
                        <div class="right"><a href="javascript:receiptView('<%=tno%>','<%= ordr_idxx %>','<%= amount %>')">�������� Ȯ���մϴ�.</a></div>
                    </li>
                </ul> 
                <div class="line-type-1"></div>

<%
                    /* = -------------------------------------------------------------- = */
                    /* =   ���հ���(����Ʈ+�ſ�ī��) ���� ��� ó��  (����Ʈ����)       = */
                    /* = -------------------------------------------------------------- = */
                     if ( pnt_issue.equals("SCSK") || pnt_issue.equals( "SCWB" ) )
                    {
%>
                    <div class="line-type-1"></div>
                    <h2 class="title-type-3">����Ʈ ����</h2>
                    <ul class="list-type-1">
                    <!-- ����Ʈ�� -->
                    <li>
                        <div class="left"><p class="title">����Ʈ��</p></div>
                        <div class="right"><%= pnt_issue %></div>
                    </li>
                    <!-- ����Ʈ ���νð� -->
                    <li>
                        <div class="left"><p class="title">����Ʈ ���νð�</p></div>
                        <div class="right"><%= pnt_app_time %></div>
                    </li>
                    <!-- ����Ʈ ���ι�ȣ -->
                    <li>
                        <div class="left"><p class="title">����Ʈ ���ι�ȣ</p></div>
                        <div class="right"><%= pnt_app_no %></div>
                    </li>
                    <!-- �����ݾ� or ���ݾ� -->
                    <li>
                        <div class="left"><p class="title">�����ݾ� or ���ݾ�</p></div>
                        <div class="right"><%= pnt_amount %></div>
                    </li>
                    <!-- �߻� ����Ʈ -->
                    <li>
                        <div class="left"><p class="title">�߻� ����Ʈ</p></div>
                        <div class="right"><%= add_pnt %></div>
                    </li>
                    <!-- ��밡�� ����Ʈ -->
                    <li>
                        <div class="left"><p class="title">��밡�� ����Ʈ</p></div>
                        <div class="right"><%= use_pnt %></div>
                    </li>
                    <!-- �� ���� ����Ʈ -->
                    <li>
                        <div class="left"><p class="title">�� ���� ����Ʈ</p></div>
                        <div class="right"><%= rsv_pnt %></div>
                    </li>
				</ul> 
                <div class="line-type-1"></div>

               
<%                  }
			    }
                /* ============================================================================== */
                /* =   ������ü ���� ��� ���                                                  = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("010000000000"))       // ������ü
                {
%>
                <div class="line-type-1"></div>
                <h2 class="title-type-3">������ü ����</h2>
                <ul class="list-type-1">
                    <!-- �������� : ������ü -->
                    <li>
                        <div class="left"><p class="title">���� ����</p></div>
                        <div class="right">������ü</div>
                    </li>
                    <!-- ��ü ���� -->
                    <li>
                        <div class="left"><p class="title">��ü ����</p></div>
                        <div class="right"><%= bank_name %></div>
                    </li>
                    <!-- ��ü �����ڵ� -->
                    <li>
                        <div class="left"><p class="title">��ü �����ڵ�</p></div>
                        <div class="right"><%= bank_code %></div>
                    </li>
                    <!-- ���� �ð� -->
                    <li>
                        <div class="left"><p class="title">���� �ð�</p></div>
                        <div class="right"><%= app_time %></div>
                    </li>
                </ul>
                <div class="line-type-1"></div>
<%
                }
                /* ============================================================================== */
                /* =   ������� ���� ��� ���                                                  = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("001000000000"))
                {
%>
                <div class="line-type-1"></div>
                <h2 class="title-type-3">������� ����</h2>
                <ul class="list-type-1">
                    <!-- �������� : ������� -->
                    <li>
                        <div class="left"><p class="title">���� ����</p></div>
                        <div class="right">�������</div>
                    </li>
                    <!-- �Ա����� -->
                    <li>
                        <div class="left"><p class="title">�Ա� ����</p></div>
                        <div class="right"><%= bankname %></div>
                    </li>
                    <!-- �Աݰ��� ������ -->
                    <li>
                        <div class="left"><p class="title">�Ա��� ���� ������</p></div>
                        <div class="right"><%= depositor %></div>
                    </li>
                    <!-- �Աݰ��� ��ȣ -->
                    <li>
                        <div class="left"><p class="title">�Ա��� ���� ��ȣ</p></div>
                        <div class="right"><%= account %></div>
                    </li>
                    <!-- ������� �Աݸ����ð� -->
                    <li>
                        <div class="left"><p class="title">������� �Աݸ����ð�</p></div>
                        <div class="right"><%= va_date %></div>
                    </li>
                    <!-- ������� �����Ա�(�׽�Ʈ��) -->
                    <li>
                        <div class="left"><p class="title">������� �����Ա�</br>(�׽�Ʈ�� ���)</p></div>
                        <div class="right"><a href="javascript:receiptView3()">�����Ա�<a/></div>
                    </li>
                </ul>
                <div class="line-type-1"></div>
<%
                }
                /* ============================================================================== */
                /* =   ����Ʈ ���� ��� ���                                                    = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("000100000000"))
                {
%>
                <div class="line-type-1"></div>
                <h2 class="title-type-3">����Ʈ ����</h2>
                <ul class="list-type-1">
                    <!-- �������� : ����Ʈ -->
                    <li>
                        <div class="left"><p class="title">���� ����</p></div>
                        <div class="right">����Ʈ</div>
                    </li>
                    <!-- ����Ʈ�� -->
                    <li>
                        <div class="left"><p class="title">����Ʈ��</p></div>
                        <div class="right"><%= pnt_issue %></div>
                    </li>
                    <!-- ����Ʈ ���νð� -->
                    <li>
                        <div class="left"><p class="title">����Ʈ ���νð�</p></div>
                        <div class="right"><%= pnt_app_time %></div>
                    </li>
                    <!-- ����Ʈ ���ι�ȣ -->
                    <li>
                        <div class="left"><p class="title">����Ʈ ���ι�ȣ</p></div>
                        <div class="right"><%= pnt_app_no %></div>
                    </li>
                    <!-- �����ݾ� or ���ݾ� -->
                    <li>
                        <div class="left"><p class="title">�����ݾ� or ���ݾ�</p></div>
                        <div class="right"><%= pnt_amount %></div>
                    </li>
                    <!-- �߻� ����Ʈ -->
                    <li>
                        <div class="left"><p class="title">�߻� ����Ʈ</p></div>
                        <div class="right"><%= add_pnt %></div>
                    </li>
                    <!-- ��밡�� ����Ʈ -->
                    <li>
                        <div class="left"><p class="title">��밡�� ����Ʈ</p></div>
                        <div class="right"><%= use_pnt %></div>
                    </li>
                    <!-- �� ���� ����Ʈ -->
                    <li>
                        <div class="left"><p class="title">�� ���� ����Ʈ</p></div>
                        <div class="right"><%= rsv_pnt %></div>
                    </li>
                </ul>
                <div class="line-type-1"></div>
                                    
<%
                }
                /* ============================================================================== */
                /* =   �޴��� ���� ��� ���                                                    = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("000010000000"))
                {
%>
                <div class="line-type-1"></div>
                <h2 class="title-type-3">�޴��� ����</h2>
                <ul class="list-type-1">
                    <!-- �������� : �޴��� -->
                    <li>
                        <div class="left"><p class="title">���� ����</p></div>
                        <div class="right">�޴���</div>
                    </li>
                    <!-- ���� �ð� -->
                    <li>
                        <div class="left"><p class="title">���� �ð�</p></div>
                        <div class="right"><%= app_time %></div>
                    </li>
                    <!-- ��Ż��ڵ� -->
                    <li>
                        <div class="left"><p class="title">��Ż� �ڵ�</p></div>
                        <div class="right"><%= commid %></div>
                    </li>
                    <!-- �޴��� ��ȣ -->
                    <li>
                        <div class="left"><p class="title">�޴��� ��ȣ</p></div>
                        <div class="right"><%= mobile_no %></div>
                    </li>
                </ul>
                <div class="line-type-1"></div>
                    
<%
                }
                /* ============================================================================== */
                /* =   ��ǰ�� ���� ��� ���                                                    = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("000000001000"))
                {
%>
                <div class="line-type-1"></div>
                <h2 class="title-type-3">��ǰ�� ����</h2>
                <ul class="list-type-1">
                    <!-- �������� : ��ǰ�� -->
                    <li>
                        <div class="left"><p class="title">���� ����</p></div>
                        <div class="right">��ǰ��</div>
                    </li>
                    <!-- �߱޻� �ڵ� -->
                    <li>
                        <div class="left"><p class="title">�߱޻� �ڵ�</p></div>
                        <div class="right"><%= tk_van_code %></div>
                    </li>
                    <!-- ���� �ð� -->
                    <li>
                        <div class="left"><p class="title">���� �ð�</p></div>
                        <div class="right"><%= app_time %></div>
                    </li>
                    <!-- ���� ��ȣ -->
                    <li>
                        <div class="left"><p class="title">���� ��ȣ</p></div>
                        <div class="right"><%= tk_app_no %></div>
                    </li>
                </ul>
                <div class="line-type-1"></div>
<%
                }
                /* ============================================================================== */
                /* =   ���ݿ����� ���� ���                                                     = */
                /* = -------------------------------------------------------------------------- = */
                if( !"".equals ( cash_yn ) )
                {
                    if ( "010000000000".equals ( use_pay_method ) | "001000000000".equals ( use_pay_method ) )
                    {
%>
                <!-- ���ݿ����� ���� ���-->
                <div class="line-type-1"></div>
                <h2 class="title-type-3">���ݿ����� ����</h2>
                <ul class="list-type-1">
                    <!-- �������� : ��ǰ�� -->
                    <li>
                        <div class="left"><p class="title">���ݿ����� ��Ͽ���</p></div>
                        <div class="right"><%= cash_yn %></div>
                    </li>
<%
                    //���ݿ������� ��ϵ� ��� ���ι�ȣ ���� ����
                    if( !"".equals ( cash_authno ) )
                    {
%>
                    <!-- ���ݿ����� ���ι�ȣ -->
                    <li>
                        <div class="left"><p class="title">���ݿ����� ���ι�ȣ</p></div>
                        <div class="right"><%= cash_authno %></div>
                    </li>
                    <!-- ���� �ð� -->
                    <li>
                        <div class="left"><p class="title">���ݿ����� �ŷ���ȣ</p></div>
                        <div class="right"><%= cash_no %></div>
                    </li>
                    <!-- ������ Ȯ�� -->
                    <li>
                        <div class="left"><p class="title">���ݿ����� Ȯ��</p></div>
                        <div class="right"><a href="javascript:receiptView2('<%=cash_no%>','<%= ordr_idxx %>','<%= amount %>')">���ݿ������� Ȯ���մϴ�.</a></div>
                    </li>
<%
                    }
%>
                </ul>
                <div class="line-type-1"></div>
                                    
<%
                    }
                }
            }
            /* = -------------------------------------------------------------------------- = */
            /* =   01-1-1. ���� ������ ���� ��� ��� END                                   = */
            /* ============================================================================== */
        }
        /* = -------------------------------------------------------------------------- = */
        /* =   01-1. ��ü DB ó�� ���� END                                              = */
        /* ============================================================================== */
    }
    /* = -------------------------------------------------------------------------- = */
    /* =   01. ���� ��� ��� END                                                   = */
    /* ============================================================================== */
%>
        <div Class="Line-Type-1"></div>
            <ul class="list-btn-2">
                <li><a href="../index.html" class="btn-type-3 pc-wd-2">ó������</a></li>
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
    </form>
</div>  
</body>
</html>
