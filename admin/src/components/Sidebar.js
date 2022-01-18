import './Sidebar.scss'
import React, {useState, useEffect} from "react";

import { Link } from "react-router-dom";

function Sidebar() {

  const menus = [
    { name: "나의 멤버십", path: "/members" },
    { name: "학원 정보 등록 및 수정", path: "/temp" },
    { name: "학원 쿠폰/광고 등록 및 신청", path: "/temp" },
    { name: "나의 정보 수정", path: "/temp" }
  ];
  const [clickItem, setClickItem] = useState(0);
  const click = (index) =>{
    setClickItem(index)
  }

  return (
    <div className="sidebar">
      {menus.map((menu, index) => {
        return (
          <Link to={menu.path} key={index}>
            <div className={"sidebar-item"+ (clickItem === index ? " on": "")} onClick={()=>{click(index)}}>
              <p>{menu.name}</p>
            </div>
          </Link>
        );
      })}
    </div>
  );
}

export default Sidebar;