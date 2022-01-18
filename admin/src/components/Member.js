import './Member.scss'
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import dummy from "../images/dummy_profileimg.png"
import basic from "../images/mabership_badge.png"
const Member = ({ auth }) => {


  useEffect(() => {

  }, []);

  const dummy_data = {
      name : "김착한",
      cram : "서초동수학학원",
      start : "2021년 00월 00일",
      claim : "2022년 00월 00일",
      claim_cash : "35,000원(월)",
      auto : "네"
  }

  const pgapi = () =>{
      window.open('http://ec2-3-34-144-94.ap-northeast-2.compute.amazonaws.com:9000/pgapi','target', 'top=100, left=300, width=900, height=600, toolbar=no, menubar=no, location=no, status=no, scrollbars=no')
  }

  return (
    <div className="mamber_container">
        <div className='my_membership'>
            나의 멤버십
        </div>
        <div className='profill'>
            <div className='profill_img'>
                <img src={dummy} alt=''></img>
            </div>
            <div className='profill_info'>
                <div className='profill_badge'>
                    <img src={basic} alt=''></img>
                </div>
                <div className='profill_cram'>
                    {dummy_data.cram}
                </div>
                <div className='profill_name'>
                    {dummy_data.name}
                </div>
                <div className='profill_text'>
                    구독 시작일
                </div>
                <div className='profill_start'>
                    {dummy_data.start}
                </div>
            </div>
            <div className='linev'></div>
            <div className='payment_info'>
                <div className='month_claim'>
                    {"매월 청구일    "+dummy_data.claim}
                </div>
                <div className='claim_cash'>
                    {"청구 금액    "+dummy_data.claim_cash}
                </div>
                <div className='auto'>
                    {"자동 결제 신청    "+dummy_data.auto}
                </div>
            </div>
            <div className='sub_btn'>
                <button className='open_claim'>청구서 보기</button>
                <button className='change'>결제수단 변경</button>
            </div>
        </div>
        <div className='lineh'></div>
        <div className='membership_setting'>
            <button className='membership_update' onClick={pgapi}>
                멤버십 업데이트
            </button>
            <button className='subscribe_cancel'>
                구독 취소
            </button>
        </div>

    </div>
  );
};

export default Member;
